class Location < ApplicationRecord
  belongs_to :team
  belongs_to :parent, :class_name => "Location", foreign_key: 'parent_id', :optional => true

  has_many :assignments
  has_many :children, :class_name => "Location", foreign_key: 'parent_id'

  def to_label
      if (I18n.locale == :zh) then
          "#{local_name}"
      else
          "#{name}"
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
