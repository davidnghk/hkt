json.extract! sale, :id, :team_id, :category, :sale_date, :our_ref, :client_ref, :client_id, :project_site, :attention, :phone, :total_amount, :authorised_person, :authorised_date, :aasm_state, :created_at, :updated_at
json.url sale_url(sale, format: :json)
