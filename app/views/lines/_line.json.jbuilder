json.extract! line, :id, :lineable_id, :lineable_type, :product_id, :price, :quantity, :created_at, :updated_at
json.url line_url(line, format: :json)
