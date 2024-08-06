json.extract! sale_item, :id, :Sale_id, :work_item_id, :price, :quantity, :amount, :created_at, :updated_at
json.url sale_item_url(sale_item, format: :json)
