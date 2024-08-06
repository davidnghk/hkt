require "application_system_test_case"

class WorksTest < ApplicationSystemTestCase
  setup do
    @work = works(:one)
  end

  test "visiting the index" do
    visit works_url
    assert_selector "h1", text: "Works"
  end

  test "creating a Work" do
    visit works_url
    click_on "New Work"

    fill_in "Code", with: @work.code
    fill_in "Icon", with: @work.icon_id
    fill_in "Local name", with: @work.local_name
    fill_in "Name", with: @work.name
    fill_in "Team", with: @work.team_id
    fill_in "Workflow", with: @work.workflow_id
    click_on "Create Work"

    assert_text "Work was successfully created"
    click_on "Back"
  end

  test "updating a Work" do
    visit works_url
    click_on "Edit", match: :first

    fill_in "Code", with: @work.code
    fill_in "Icon", with: @work.icon_id
    fill_in "Local name", with: @work.local_name
    fill_in "Name", with: @work.name
    fill_in "Team", with: @work.team_id
    fill_in "Workflow", with: @work.workflow_id
    click_on "Update Work"

    assert_text "Work was successfully updated"
    click_on "Back"
  end

  test "destroying a Work" do
    visit works_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Work was successfully destroyed"
  end
end
