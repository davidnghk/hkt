json.extract! work_item, :id, :work_id, :code, :name, :local_name, :parent_id, :created_at, :updated_at
json.url work_item_url(work_item, format: :json)
