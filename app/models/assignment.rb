class Assignment < ApplicationRecord
  include AASM 
  has_ancestry

  belongs_to :client, optional: true
  belongs_to :site, optional: true

  belongs_to :location, optional: true
  belongs_to :work
  belongs_to :team
  has_many :users, through: :team
  belongs_to :operation_team, :class_name => "Team", foreign_key: 'operation_team_id', :optional => true
  has_many :operators, through: :operator_team
  belongs_to :parent, :class_name => "Assignment", foreign_key: 'parent_id', :optional => true
#  belongs_to :work, :class_name => "Master", :foreign_key => "work_id"
    
  has_many :assignment_logs
  has_many :team_assignments
  has_many :teams, through: :team_assignments

  has_many :photos, as: :photoable, dependent: :destroy   
  has_many_attached :uploadfiles

  has_many :assignmees, dependent: :destroy  
  has_many :assignment_item, dependent: :destroy  
  has_many :defects, dependent: :destroy  
  has_many :lines, as: :lineable, dependent: :destroy

  before_create :set_ref_no 
  before_create :set_default_values
  before_create :set_status 
  before_update :set_status, :if => :aasm_state_changed? 
 # before_save :to_delete_bimfile

  validates :start_datetime, presence: true
  validates :due_datetime, presence: true
  validates :end_datetime, presence: true
  validates :aasm_state, presence: true
  validates :status, presence: true
#  validates :name, presence: true

  scope :latest, -> { order(start_date: :desc) }
  scope :aasm_state, -> (aasm_state) { where aasm_state: aasm_state }
  scope :reviewed, -> { where('star > ? and start_datetime > ?', 0, Time.now.utc.prev_month.end_of_month) }  

  enum status: { "Open" => 0, "Pending" => 1, "Working" => 2, "Rating" => 3, "Closed" => 4}
  aasm do
    state :booked, :initial => true
    state :asked, :approved, :infoForRequest, :rejected, :assigned, :acknowledged, :infoForWork
    state :inProgress, :completed, :appraised, :cancelled

    event :ask  do
      transitions from:  [:booked, :infoForRequest], to: :asked
    end
    event :reject do
      transitions from: [:booked, :asked], to: :rejected
    end
    event :askRequestInfo do
      transitions from: [:asked, :approved, :infoForWork ], to: :infoForRequest
    end
    event :cancel do
      transitions from: [:booked, :infoForRequest, :inProgress], to: :cancelled
    end
    event :approve do
      transitions from:  [:asked], to: :approved
    end
    event :assign do
      transitions from: [:approved, :asked, :infoForWork], to: :assigned
    end
    event :askWorkInfo do
      transitions from: :assigned, to: :infoForWork
    end
    event :acknowledge do
      transitions from: :assigned, to: :acknowledged
    end
    event :start do
      transitions :from => [:booked, :assigned, :acknowledged], to: :inProgress 
    end
    event :complete do
      transitions :from => :inProgress, to: :completed
    end
    event :appraise do
      transitions :from => :completed, to: :appraised
    end    
  end

  def all_day_event?
    self.start_datetime == self.start_datetime.midnight && self.due_datetime == self.due_datetime.midnight ? true : false
  end

  private

  def set_status 
    if self.booked? or self.infoForRequest? 
      self.status = 0
    elsif self.asked? or self.approved? or self.infoForWork?
      self.status = 1
    elsif self.assigned? or self.acknowledged? or self.inProgress? 
      self.status = 2
    elsif self.completed? 
      self.status = 3
    elsif self.appraised? or self.cancelled? or self.rejected?
      self.status = 4
    else
      self.status = 0
    end
  end

  def set_ref_no
    max_code = Assignment.maximum(:ref_no)
    cur_year = Date.current.year - 2000 
    if max_code.to_i > cur_year * 10000
      self.ref_no = max_code.to_i + 1
    else 
      self.ref_no = cur_year * 100000 + 1
    end 
  end

  def set_default_values
    if self.date_range? and self.start_datetime.nil?
      self.start_datetime ||= self.date_range[0..15]
      self.due_datetime ||= self.date_range[19..34]
      self.end_datetime ||= self.date_range[19..34]      
    else
      self.start_datetime ||= Time.now
      self.due_datetime ||= Time.now + 30.minutes
      self.end_datetime ||= Time.now + 30.minutes
    end
    self.color ||= 'yellow' 
    self.status ||= 0 
    self.location_id ||= 1    
    self.operation_team_id ||= self.team_id
#    if self.work_code? and self.work_id.nil?
#      l = Location.where("code = ? ", self.location_code)
#      w = Master.where(" parent_id = 2 and code = ? ", self.work_code) 
#    else    
#      l = self.location_id
#      w = self.work_id
#    end
#	self.operation_team ||= current_team 
  end

  def syn_dates
    if !self.date_range.nil?
      self.start_datetime = self.date_range[0..15]
      self.due_datetime = self.date_range[19..34]
      self.end_datetime = self.date_range[19..34]
      self.date_range = nil
    end
  end

private

  def to_delete_bimfile
    if self.delete_bimfile? 
      bimfile.purge_later
    end
  end

end
