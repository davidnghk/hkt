json.extract! product, :id, :code, :name, :local_name, :unit_rate, :unit_type_id, :parent_id, :created_at, :updated_at
json.url product_url(product, format: :json)
