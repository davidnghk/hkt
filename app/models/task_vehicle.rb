class TaskVehicle < ApplicationRecord
  belongs_to :task
  belongs_to :vehicle, :class_name => "Master", foreign_key: 'vehicle_id', :optional => true
  belongs_to :driver, :class_name => "Master", foreign_key: 'driver_id', :optional => true

  before_create :set_category   

  def set_category
    self.category = self.vehicle.name
    if self.task.start_time?
      self.booking_date = self.task.start_time
    else
      self.booking_date = self.task.task_date
    end
    self.run_km = self.end_km - self.start_km
  end

  def trip_km 
    if self.start_km? and self.end_km?
      self.end_km - self.start_km
    end
  end

end
