class AssignmentLog < ApplicationRecord
  belongs_to :assignment
  belongs_to :operation_team, :class_name => "Team", foreign_key: 'operation_team_id', :optional => true
  belongs_to :team, :class_name => "Team", foreign_key: 'team_id', :optional => true
  belongs_to :actor, :class_name => "User", foreign_key: 'actor_id'
end
