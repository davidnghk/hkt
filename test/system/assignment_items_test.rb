require "application_system_test_case"

class AssignmentItemsTest < ApplicationSystemTestCase
  setup do
    @assignment_item = assignment_items(:one)
  end

  test "visiting the index" do
    visit assignment_items_url
    assert_selector "h1", text: "Assignment Items"
  end

  test "creating a Assignment item" do
    visit assignment_items_url
    click_on "New Assignment Item"

    fill_in "Assignment", with: @assignment_item.assignment_id
    fill_in "Rating", with: @assignment_item.rating
    fill_in "Remarks", with: @assignment_item.remarks
    fill_in "Work item", with: @assignment_item.work_item
    click_on "Create Assignment item"

    assert_text "Assignment item was successfully created"
    click_on "Back"
  end

  test "updating a Assignment item" do
    visit assignment_items_url
    click_on "Edit", match: :first

    fill_in "Assignment", with: @assignment_item.assignment_id
    fill_in "Rating", with: @assignment_item.rating
    fill_in "Remarks", with: @assignment_item.remarks
    fill_in "Work item", with: @assignment_item.work_item
    click_on "Update Assignment item"

    assert_text "Assignment item was successfully updated"
    click_on "Back"
  end

  test "destroying a Assignment item" do
    visit assignment_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Assignment item was successfully destroyed"
  end
end
