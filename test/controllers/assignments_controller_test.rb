require 'test_helper'

class AssignmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assignment = assignments(:one)
  end

  test "should get index" do
    get assignments_url
    assert_response :success
  end

  test "should get new" do
    get new_assignment_url
    assert_response :success
  end

  test "should create assignment" do
    assert_difference('Assignment.count') do
      post assignments_url, params: { assignment: { aasm_state: @assignment.aasm_state, aasm_supplement: @assignment.aasm_supplement, address: @assignment.address, altitude: @assignment.altitude, ancestry: @assignment.ancestry, block_hash: @assignment.block_hash, color: @assignment.color, comments: @assignment.comments, date_range: @assignment.date_range, due_datetime: @assignment.due_datetime, end_datetime: @assignment.end_datetime, latitude: @assignment.latitude, location_id: @assignment.location_id, longitude: @assignment.longitude, name: @assignment.name, nonce: @assignment.nonce, operation_team_id: @assignment.operation_team_id, parent_id: @assignment.parent_id, ref_no: @assignment.ref_no, start_datetime: @assignment.start_datetime, status: @assignment.status, team_id: @assignment.team_id, user_ref: @assignment.user_ref, work_id: @assignment.work_id } }
    end

    assert_redirected_to assignment_url(Assignment.last)
  end

  test "should show assignment" do
    get assignment_url(@assignment)
    assert_response :success
  end

  test "should get edit" do
    get edit_assignment_url(@assignment)
    assert_response :success
  end

  test "should update assignment" do
    patch assignment_url(@assignment), params: { assignment: { aasm_state: @assignment.aasm_state, aasm_supplement: @assignment.aasm_supplement, address: @assignment.address, altitude: @assignment.altitude, ancestry: @assignment.ancestry, block_hash: @assignment.block_hash, color: @assignment.color, comments: @assignment.comments, date_range: @assignment.date_range, due_datetime: @assignment.due_datetime, end_datetime: @assignment.end_datetime, latitude: @assignment.latitude, location_id: @assignment.location_id, longitude: @assignment.longitude, name: @assignment.name, nonce: @assignment.nonce, operation_team_id: @assignment.operation_team_id, parent_id: @assignment.parent_id, ref_no: @assignment.ref_no, start_datetime: @assignment.start_datetime, status: @assignment.status, team_id: @assignment.team_id, user_ref: @assignment.user_ref, work_id: @assignment.work_id } }
    assert_redirected_to assignment_url(@assignment)
  end

  test "should destroy assignment" do
    assert_difference('Assignment.count', -1) do
      delete assignment_url(@assignment)
    end

    assert_redirected_to assignments_url
  end
end
