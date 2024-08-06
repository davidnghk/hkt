class Sale < ApplicationRecord
  include AASM 
  
  has_one_attached :uploadfile
  has_rich_text :remarks
  has_rich_text :address
  has_rich_text :ship_to_address
  has_rich_text :term_details

  belongs_to :parent, :class_name => "Sale", foreign_key: 'parent_id', :optional => true
  belongs_to :team
  # belongs_to :term, :class_name => "Master", foreign_key: 'term_id', :optional => true
  belongs_to :authorised_staff, :class_name => "Master", foreign_key: 'authorised_staff_id', :optional => true

  belongs_to :client
  belongs_to :ship_client, :class_name => "Client", foreign_key: 'ship_client_id', :optional => true
  has_many :sale_items
  has_many :lines, as: :lineable, dependent: :delete_all
  has_many :products, through: :lines
  has_many :photos, as: :photoable, dependent: :destroy  
  has_many :folders, as: :foldable, dependent: :delete_all
  
  has_and_belongs_to_many :terms

  validates :client_id, presence: true
#  validates_uniqueness_of :our_ref
 
  default_scope { order(sale_date: :desc) }

  scope :Quotation, -> { where(quotation: 0) }
  scope :Invoice, -> { where(quotation: 1) }

  before_create :set_ref
  before_create :calc_amount
  before_update :calc_amount

  enum category: [:quotation, :invoice, :work]
  enum category: { "Quotation" => 0, "Invoice" => 1, "Work" => 2}
  enum status: { "prepared" => 0, "pending" => 1, "authoised" => 2, "mailed" => 3, "confirmed" => 4}
  aasm do
    state :prepared, :initial => true
    state :pending, :authorised, :delivered, :cancelled, :mailed, :confirmed

    event :cancel  do
      transitions from:  [:prepared, :confirmed, :mailed], to: :cancelled
    end

    event :mail  do
      transitions from:  [:prepared], to: :mailed
    end

    event :confirm  do
      transitions from:  [:mailed, :prepared], to: :confirmed
    end
    
    event :pend do
      transitions from: [:prepared], to: :pending
    end
    event :authorise do
      transitions from: :pending, to: :authorised
    end
    event :deliver do
      transitions from: :authorised, to: :delivered
    end
  end

  default_scope { order(id: :desc) }

  def amount_before_discount
    total = 0
    self.lines.each do |line|
      if line.quantity?
        total = total + line.actual_price * line.quantity 
      end
    end
    total
  end
  
  def calc_amount
    total = self.amount_before_discount * ( 1 - discount/100.0) 
  end

  def set_ref
    if self.category == "Quotation"
      if Sale.Quotation.count == 0
        self.our_ref = "Q" + Date.current.year.to_s + "-" + 1.to_s.rjust(4, "0")
      else
        last_ref = Sale.Quotation.maximum("our_ref")
        max_year = last_ref[1,4]
        if max_year == Date.current.year.to_s
          next_no = last_ref[6,4].to_i + 1
          self.our_ref = "Q" + Date.current.year.to_s + "-" + next_no.to_s.rjust(4, "0")
        else 
          self.our_ref = "Q" + Date.current.year.to_s + "-" + 1.to_s.rjust(4, "0")
        end
      end 
    else
      if Sale.Invoice.count == 0
        self.our_ref = "00100000"
      else 
        last_ref_no = Sale.Invoice.maximum("our_ref").to_i
        self.out_ref = (last_ref_no + 1 ).rjust(8, "0")
      end
    end
  end

end   
