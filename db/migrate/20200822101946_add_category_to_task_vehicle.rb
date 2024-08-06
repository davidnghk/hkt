class AddCategoryToTaskVehicle < ActiveRecord::Migration[6.0]
  def change
    add_column :task_vehicles, :category, :string
    add_column :task_vehicles, :booking_date, :date
  end
end
