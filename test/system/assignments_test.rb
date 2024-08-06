require "application_system_test_case"

class AssignmentsTest < ApplicationSystemTestCase
  setup do
    @assignment = assignments(:one)
  end

  test "visiting the index" do
    visit assignments_url
    assert_selector "h1", text: "Assignments"
  end

  test "creating a Assignment" do
    visit assignments_url
    click_on "New Assignment"

    fill_in "Aasm state", with: @assignment.aasm_state
    fill_in "Aasm supplement", with: @assignment.aasm_supplement
    fill_in "Address", with: @assignment.address
    fill_in "Altitude", with: @assignment.altitude
    fill_in "Ancestry", with: @assignment.ancestry
    fill_in "Block hash", with: @assignment.block_hash
    fill_in "Color", with: @assignment.color
    fill_in "Comments", with: @assignment.comments
    fill_in "Date range", with: @assignment.date_range
    fill_in "Due datetime", with: @assignment.due_datetime
    fill_in "End datetime", with: @assignment.end_datetime
    fill_in "Latitude", with: @assignment.latitude
    fill_in "Location", with: @assignment.location_id
    fill_in "Longitude", with: @assignment.longitude
    fill_in "Name", with: @assignment.name
    fill_in "Nonce", with: @assignment.nonce
    fill_in "Operation team", with: @assignment.operation_team_id
    fill_in "Parent", with: @assignment.parent_id
    fill_in "Ref no", with: @assignment.ref_no
    fill_in "Start datetime", with: @assignment.start_datetime
    fill_in "Status", with: @assignment.status
    fill_in "Team", with: @assignment.team_id
    fill_in "User ref", with: @assignment.user_ref
    fill_in "Work", with: @assignment.work_id
    click_on "Create Assignment"

    assert_text "Assignment was successfully created"
    click_on "Back"
  end

  test "updating a Assignment" do
    visit assignments_url
    click_on "Edit", match: :first

    fill_in "Aasm state", with: @assignment.aasm_state
    fill_in "Aasm supplement", with: @assignment.aasm_supplement
    fill_in "Address", with: @assignment.address
    fill_in "Altitude", with: @assignment.altitude
    fill_in "Ancestry", with: @assignment.ancestry
    fill_in "Block hash", with: @assignment.block_hash
    fill_in "Color", with: @assignment.color
    fill_in "Comments", with: @assignment.comments
    fill_in "Date range", with: @assignment.date_range
    fill_in "Due datetime", with: @assignment.due_datetime
    fill_in "End datetime", with: @assignment.end_datetime
    fill_in "Latitude", with: @assignment.latitude
    fill_in "Location", with: @assignment.location_id
    fill_in "Longitude", with: @assignment.longitude
    fill_in "Name", with: @assignment.name
    fill_in "Nonce", with: @assignment.nonce
    fill_in "Operation team", with: @assignment.operation_team_id
    fill_in "Parent", with: @assignment.parent_id
    fill_in "Ref no", with: @assignment.ref_no
    fill_in "Start datetime", with: @assignment.start_datetime
    fill_in "Status", with: @assignment.status
    fill_in "Team", with: @assignment.team_id
    fill_in "User ref", with: @assignment.user_ref
    fill_in "Work", with: @assignment.work_id
    click_on "Update Assignment"

    assert_text "Assignment was successfully updated"
    click_on "Back"
  end

  test "destroying a Assignment" do
    visit assignments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Assignment was successfully destroyed"
  end
end
