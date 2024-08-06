class Team < ApplicationRecord
#  has_many :clients
  has_many :works
  has_many :sales
  has_many :locations
  has_many :members
  has_many :users, through: :members
  
  has_many :messages
  has_many :team_assignments
  has_many :assignments, through: :team_assignments 

  has_many :assignment_logs
  belongs_to :operation_assignment_logs, :class_name => "AssignmentLog", foreign_key: 'operation_team_id', :optional => true

  has_many :masters

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

end
