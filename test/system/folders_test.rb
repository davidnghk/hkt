require "application_system_test_case"

class FoldersTest < ApplicationSystemTestCase
  setup do
    @folder = folders(:one)
  end

  test "visiting the index" do
    visit folders_url
    assert_selector "h1", text: "Folders"
  end

  test "creating a Folder" do
    visit folders_url
    click_on "New Folder"

    check "Active" if @folder.active
    fill_in "Code", with: @folder.code
    fill_in "Foldable", with: @folder.foldable_id
    fill_in "Foldable type", with: @folder.foldable_type
    fill_in "Name", with: @folder.name
    click_on "Create Folder"

    assert_text "Folder was successfully created"
    click_on "Back"
  end

  test "updating a Folder" do
    visit folders_url
    click_on "Edit", match: :first

    check "Active" if @folder.active
    fill_in "Code", with: @folder.code
    fill_in "Foldable", with: @folder.foldable_id
    fill_in "Foldable type", with: @folder.foldable_type
    fill_in "Name", with: @folder.name
    click_on "Update Folder"

    assert_text "Folder was successfully updated"
    click_on "Back"
  end

  test "destroying a Folder" do
    visit folders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Folder was successfully destroyed"
  end
end
