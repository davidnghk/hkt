class Master < ApplicationRecord

  has_rich_text :description

  belongs_to :team
  belongs_to :parent, :class_name => "Master", foreign_key: 'parent_id', :optional => true
  has_many :children, :class_name => "Master", foreign_key: 'parent_id'  
  has_many :assignments, foreign_key: 'work_id'
  has_many :work_items, foreign_key: 'unit_type_id'
  has_many :products, foreign_key: 'unit_type_id'
  has_many :works, foreign_key: 'workflow_id'
  has_many :sales, foreign_key: 'term_id'
  has_many :sales, foreign_key: 'authorised_staff_id'

  has_many :task_staffs
  has_many :tasks, through: :task_staffs 
  has_many :task_vehicles
  has_many :task_materials

  scope :Term, -> { where(parent_id: 21) }
  scope :Work, -> { where(parent_id: 2) }
  scope :UserTable, -> { where(parent_id: 1) }
  scope :SysTable, -> { where(parent_id: 8) }

  scope :LocationType, -> { where(parent_id: 29) }
  scope :UnitType, -> { where(parent_id: 9) }
  scope :BusinessUnit, -> { where(parent_id: 18) }
  scope :people, -> { where(parent_id: 176) }
  scope :Workflow, -> { where(parent_id: 4) }
  scope :Icon, -> { where(parent_id: 9) }
  scope :Staff, -> { where(parent_id: 25) }
  scope :Driver, -> { where(parent_id: 25) }
  scope :TaskRole, -> { where(parent_id: 28) }
  scope :Material, -> { where(parent_id: 29) }
  scope :Vehicle, -> { where(parent_id: 30) }

  def to_label
      if (I18n.locale == :zh and self.local_name? ) then
          "#{code} : #{local_name}"
      else
          "#{code} : #{name}"
      end
  end

  def full_name
    if (I18n.locale == :zh and self.local_name? ) then
        "#{code} #{local_name}"
    else
        "#{code} #{name}"
    end
  end

  def display_name
    if (I18n.locale == :zh and self.local_name? ) then
        "#{local_name}"
    else
        "#{name}"
    end
  end

  def count_child
    Master.where(:parent_id => self.id).count
  end

  private

    def self.to_csv(options = {})
      CSV.generate(options) do |csv|
        csv << column_names
        all.each do |master|
          csv << master.attributes.values_at(*column_names)
        end
      end
    end

    def self.import(file)
      CSV.foreach(file.path, headers: true) do |row|
        Master.create! row.to_hash
      end
    end

end
