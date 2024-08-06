date_format = "%Y-%m-%d %H:%M%z"
json.extract! task, :id, :category, :task_date, :our_ref, :customer_ref, :request_ref, :location, :object_type, :created_at, :updated_at
json.url task_url(task, format: :json)
json.show_url task_url(task, format: :html)
json.start task.start_time.strftime(date_format)
json.end task.end_time.strftime(date_format)
json.allDay task.all_day
json.title task.title
