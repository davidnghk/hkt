json.extract! task_vehicle, :id, :task_id, :vehicle_id, :driver_id, :start_km, :end_km, :run_km, :tunnel_expense, :parking_expense, :created_at, :updated_at
json.url task_vehicle_url(task_vehicle, format: :json)
