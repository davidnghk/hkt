json.extract! client, :id, :team_id, :code, :name, :local_name, :created_at, :updated_at
json.url client_url(client, format: :json)
