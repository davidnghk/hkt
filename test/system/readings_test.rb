require "application_system_test_case"

class ReadingsTest < ApplicationSystemTestCase
  setup do
    @reading = readings(:one)
  end

  test "visiting the index" do
    visit readings_url
    assert_selector "h1", text: "Readings"
  end

  test "creating a Reading" do
    visit readings_url
    click_on "New Reading"

    fill_in "Content", with: @reading.content
    fill_in "Reading time", with: @reading.reading_time
    fill_in "Thing", with: @reading.thing
    fill_in "Thing", with: @reading.thing_id
    click_on "Create Reading"

    assert_text "Reading was successfully created"
    click_on "Back"
  end

  test "updating a Reading" do
    visit readings_url
    click_on "Edit", match: :first

    fill_in "Content", with: @reading.content
    fill_in "Reading time", with: @reading.reading_time
    fill_in "Thing", with: @reading.thing
    fill_in "Thing", with: @reading.thing_id
    click_on "Update Reading"

    assert_text "Reading was successfully updated"
    click_on "Back"
  end

  test "destroying a Reading" do
    visit readings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Reading was successfully destroyed"
  end
end
