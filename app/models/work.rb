class Work < ApplicationRecord
  has_paper_trail on: [:update, :destroy], only: [:code, :name, :local_name, :workflow_id]
  
  belongs_to :team
  belongs_to :icon, :class_name => "Master", :foreign_key => "icon_id", optional: true
  belongs_to :workflow, :class_name => "Master", :foreign_key => "workflow_id", optional: true

  has_many :assignments
  has_many :assignment_logs

  has_many :work_items

  def to_label
      if (I18n.locale == :zh) then
          "#{local_name}"
      else
          "#{name}"
      end
  end

  def display_name
    if (I18n.locale == :zh) then
        "#{local_name}"
    else
        "#{name}"
    end
  end

  private

end
