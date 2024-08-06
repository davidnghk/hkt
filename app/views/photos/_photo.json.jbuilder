json.extract! photo, :id, :category, :image, :longitude, :altitude, :latitude, :photoable_type, :photoable_id, :is_printable, :photo_datetime, :created_at, :updated_at
json.url photo_url(photo, format: :json)
