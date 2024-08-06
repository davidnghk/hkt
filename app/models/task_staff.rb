class TaskStaff < ApplicationRecord
  belongs_to :task
  belongs_to :staff, :class_name => "Master", foreign_key: 'staff_id', :optional => true
  belongs_to :task_role, :class_name => "Master", foreign_key: 'task_role_id', :optional => true

  before_create :set_category   

  def set_category
    self.category = self.task_role.name
    if !self.start_time?
      self.start_time = Date.today + 9.hours
    end
    if !self.end_time?
      self.end_time = Date.today + 17.hours
    end 

    if self.task.start_time?
      self.booking_date = self.task.start_time
    else
      self.booking_date = self.task.task_date
    end
  end

end
