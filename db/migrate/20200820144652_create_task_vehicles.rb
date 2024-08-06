class CreateTaskVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :task_vehicles do |t|
      t.references :task, null: true, foreign_key: true
      t.integer :vehicle_id
      t.integer :driver_id
      t.integer :start_km
      t.integer :end_km
      t.integer :run_km
      t.integer :tunnel_expense
      t.integer :parking_expense

      t.timestamps
    end
  end
end
