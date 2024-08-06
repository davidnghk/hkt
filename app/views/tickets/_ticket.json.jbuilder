json.extract! ticket, :id, :no, :user_id, :actor_id, :message, :notifiable_id, :notifiable_type, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
