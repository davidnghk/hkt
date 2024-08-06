json.extract! task_material, :id, :task_id, :material_id, :quantity, :cost, :created_at, :updated_at
json.url task_material_url(task_material, format: :json)
