require "application_system_test_case"

class CommoditiesTest < ApplicationSystemTestCase
  setup do
    @commodity = commodities(:one)
  end

  test "visiting the index" do
    visit commodities_url
    assert_selector "h1", text: "Commodities"
  end

  test "creating a Commodity" do
    visit commodities_url
    click_on "New Commodity"

    fill_in "Code", with: @commodity.code
    fill_in "Local name", with: @commodity.local_name
    fill_in "Name", with: @commodity.name
    fill_in "Tag", with: @commodity.tag
    click_on "Create Commodity"

    assert_text "Commodity was successfully created"
    click_on "Back"
  end

  test "updating a Commodity" do
    visit commodities_url
    click_on "Edit", match: :first

    fill_in "Code", with: @commodity.code
    fill_in "Local name", with: @commodity.local_name
    fill_in "Name", with: @commodity.name
    fill_in "Tag", with: @commodity.tag
    click_on "Update Commodity"

    assert_text "Commodity was successfully updated"
    click_on "Back"
  end

  test "destroying a Commodity" do
    visit commodities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Commodity was successfully destroyed"
  end
end
