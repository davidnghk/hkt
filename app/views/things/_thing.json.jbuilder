json.extract! thing, :id, :thingable_id, :thingable_type, :code, :cname, :local_name, :category_id, :parent_id, :created_at, :updated_at
json.url thing_url(thing, format: :json)
