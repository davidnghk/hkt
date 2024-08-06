json.array! @assignments do |assignment|
  date_format = assignment.all_day_event? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'
  json.id assignment.id
  json.work_id assignment.work_id
  json.location_id assignment.location_id
  json.team_id assignment.team_id
  json.aasm_state assignment.aasm_state
  json.title assignment.name
  json.start assignment.start_datetime
  json.end assignment.due_datetime
  json.color assignment.color unless assignment.color.blank?
  json.allDay assignment.all_day_event? ? true : false
  json.calendar_update_url calendar_update_assignment_path(assignment, method: :patch)
  json.update_url assignment_path(assignment, method: :patch)
  json.edit_url edit_assignment_path(assignment)
end

