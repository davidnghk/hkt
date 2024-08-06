require "application_system_test_case"

class ThingsTest < ApplicationSystemTestCase
  setup do
    @thing = things(:one)
  end

  test "visiting the index" do
    visit things_url
    assert_selector "h1", text: "Things"
  end

  test "creating a Thing" do
    visit things_url
    click_on "New Thing"

    fill_in "Category", with: @thing.category_id
    fill_in "Cname", with: @thing.cname
    fill_in "Code", with: @thing.code
    fill_in "Local name", with: @thing.local_name
    fill_in "Parent", with: @thing.parent_id
    fill_in "Thingable", with: @thing.thingable_id
    fill_in "Thingable type", with: @thing.thingable_type
    click_on "Create Thing"

    assert_text "Thing was successfully created"
    click_on "Back"
  end

  test "updating a Thing" do
    visit things_url
    click_on "Edit", match: :first

    fill_in "Category", with: @thing.category_id
    fill_in "Cname", with: @thing.cname
    fill_in "Code", with: @thing.code
    fill_in "Local name", with: @thing.local_name
    fill_in "Parent", with: @thing.parent_id
    fill_in "Thingable", with: @thing.thingable_id
    fill_in "Thingable type", with: @thing.thingable_type
    click_on "Update Thing"

    assert_text "Thing was successfully updated"
    click_on "Back"
  end

  test "destroying a Thing" do
    visit things_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Thing was successfully destroyed"
  end
end
