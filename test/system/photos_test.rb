require "application_system_test_case"

class PhotosTest < ApplicationSystemTestCase
  setup do
    @photo = photos(:one)
  end

  test "visiting the index" do
    visit photos_url
    assert_selector "h1", text: "Photos"
  end

  test "creating a Photo" do
    visit photos_url
    click_on "New Photo"

    fill_in "Altitude", with: @photo.altitude
    fill_in "Category", with: @photo.category
    fill_in "Image", with: @photo.image
    check "Is printable" if @photo.is_printable
    fill_in "Latitude", with: @photo.latitude
    fill_in "Longitude", with: @photo.longitude
    fill_in "Photo datetime", with: @photo.photo_datetime
    fill_in "Photoable", with: @photo.photoable_id
    fill_in "Photoable type", with: @photo.photoable_type
    click_on "Create Photo"

    assert_text "Photo was successfully created"
    click_on "Back"
  end

  test "updating a Photo" do
    visit photos_url
    click_on "Edit", match: :first

    fill_in "Altitude", with: @photo.altitude
    fill_in "Category", with: @photo.category
    fill_in "Image", with: @photo.image
    check "Is printable" if @photo.is_printable
    fill_in "Latitude", with: @photo.latitude
    fill_in "Longitude", with: @photo.longitude
    fill_in "Photo datetime", with: @photo.photo_datetime
    fill_in "Photoable", with: @photo.photoable_id
    fill_in "Photoable type", with: @photo.photoable_type
    click_on "Update Photo"

    assert_text "Photo was successfully updated"
    click_on "Back"
  end

  test "destroying a Photo" do
    visit photos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Photo was successfully destroyed"
  end
end
