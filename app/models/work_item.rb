class WorkItem < ApplicationRecord
  has_rich_text :description
  belongs_to :work
  belongs_to :unit_type, :class_name => "Master", foreign_key: "unit_type_id", :optional => true
  has_many :assignment_item, dependent: :destroy  

  def to_label
    if (I18n.locale == :zh) then
      "#{code} #{local_name} #{heading} "
    else
      "#{code} #{name} #{heading} "
    end
  end

  def display_name
    if (I18n.locale == :zh) then
        "#{code} #{local_name}"
    else
        "#{code} #{name}"
    end
  end

end
