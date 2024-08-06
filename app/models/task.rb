class Task < ApplicationRecord
  include AASM  

  belongs_to :laboratory, :optional => true
  belongs_to :client, :optional => true

  has_many :task_staffs, dependent: :destroy
  accepts_nested_attributes_for :task_staffs, allow_destroy: true, reject_if: proc { |attr| attr['task_role_id'].blank? }
  has_many :task_vehicles, dependent: :destroy
  accepts_nested_attributes_for :task_vehicles, allow_destroy: true, reject_if: proc { |attr| attr['vehicle_id'].blank? }
  has_many :task_materials, dependent: :destroy
  accepts_nested_attributes_for :task_materials, allow_destroy: true, reject_if: proc { |attr| attr['material_id'].blank? }

  has_many :staffs, through: :task_staffs
  has_many :vehicles, through: :task_vehicles
  has_many :materials, through: :task_materials

  enum category: { "SampleCollection" => 0, "Work" => 1, "Trip" => 2}
  enum object_type: ["Cube", "Others"]

  # validates_uniqueness_of :our_ref
  
  aasm do
    state :requested, :initial => true
    state :completed, :cancelled

    event :cancel  do
      transitions from:  [:requested, :completed], to: :cancelled
    end

    event :complete  do
      transitions from:  [:requested], to: :completed
    end
  end

  before_save :set_dates   

  def set_dates
    self.start_time || self.task_date + 9.hours
    self.end_time || self.task_date + 18.hours
    if self.laboratory_id?
      self.category = 2
    end
  end

  default_scope { order(task_date: :desc) }

  before_create do
    self.task_date  = Date.today unless self.task_date
    self.start_time = DateTime.now unless self.start_time 
    self.end_time   = DateTime.now unless self.end_time
  end

  def self.number_of_staffs
    self.task_staffs.count 
  end

  def client_name
    if self.client_id?
      self.client.client_name
    else
      self.request_ref
    end
  end

  def self.import(file)
    current_request_ref_no = ""
    CSV.foreach(file.path, headers: true) do |row| 
      if Task.where(request_ref: row["request_ref"], customer_ref: row["customer_contract_no"] ).count == 0
        Task.create!([
          {request_ref: row["request_ref"],
            customer_ref: row["customer_contract_no"],
            request_ref: row["request_ref"],
            object_type: row["type"],
            name: row["size"],
            location: row["location"],
          },
        ])
      end

      task = Task.where(request_ref: row["request_ref"], customer_ref: row["customer_contract_no"] ).first
      if Container.where(task_id: task.id, code: row["request_ref_no"] ).count == 0
        Container.create!([
          {task_id: task.id,
            code: row["request_ref_no"],
            object: row["type"],
            size: row["size"],
            quantity: 1,
          }
        ])
      else
        container = Container.where(task_id: task.id, code: row["request_ref_no"] ).first
        container.quantity = container.quantity + 1 
        container.save
      end

    end 
  end
      
end
