json.extract! site, :id, :client_id, :code, :name, :local_name, :created_at, :updated_at
json.url site_url(site, format: :json)
