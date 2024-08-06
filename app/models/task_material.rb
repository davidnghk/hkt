class TaskMaterial < ApplicationRecord
  belongs_to :task
  belongs_to :material, :class_name => "Master", foreign_key: 'material_id', :optional => true

  before_create :set_category   

  def set_category
    self.category = self.material.name
    if self.task.start_time?
      self.booking_date = self.task.start_time
    else
      self.booking_date = self.task.task_date
    end
  end

end
