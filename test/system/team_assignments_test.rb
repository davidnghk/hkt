require "application_system_test_case"

class TeamAssignmentsTest < ApplicationSystemTestCase
  setup do
    @team_assignment = team_assignments(:one)
  end

  test "visiting the index" do
    visit team_assignments_url
    assert_selector "h1", text: "Team Assignments"
  end

  test "creating a Team assignment" do
    visit team_assignments_url
    click_on "New Team Assignment"

    fill_in "Assignment", with: @team_assignment.assignment_id
    fill_in "Role", with: @team_assignment.role_id
    fill_in "Team", with: @team_assignment.team_id
    click_on "Create Team assignment"

    assert_text "Team assignment was successfully created"
    click_on "Back"
  end

  test "updating a Team assignment" do
    visit team_assignments_url
    click_on "Edit", match: :first

    fill_in "Assignment", with: @team_assignment.assignment_id
    fill_in "Role", with: @team_assignment.role_id
    fill_in "Team", with: @team_assignment.team_id
    click_on "Update Team assignment"

    assert_text "Team assignment was successfully updated"
    click_on "Back"
  end

  test "destroying a Team assignment" do
    visit team_assignments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Team assignment was successfully destroyed"
  end
end
