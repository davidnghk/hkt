require "application_system_test_case"

class LinesTest < ApplicationSystemTestCase
  setup do
    @line = lines(:one)
  end

  test "visiting the index" do
    visit lines_url
    assert_selector "h1", text: "Lines"
  end

  test "creating a Line" do
    visit lines_url
    click_on "New Line"

    fill_in "Lineable", with: @line.lineable_id
    fill_in "Lineable type", with: @line.lineable_type
    fill_in "Price", with: @line.price
    fill_in "Product", with: @line.product_id
    fill_in "Quantity", with: @line.quantity
    click_on "Create Line"

    assert_text "Line was successfully created"
    click_on "Back"
  end

  test "updating a Line" do
    visit lines_url
    click_on "Edit", match: :first

    fill_in "Lineable", with: @line.lineable_id
    fill_in "Lineable type", with: @line.lineable_type
    fill_in "Price", with: @line.price
    fill_in "Product", with: @line.product_id
    fill_in "Quantity", with: @line.quantity
    click_on "Update Line"

    assert_text "Line was successfully updated"
    click_on "Back"
  end

  test "destroying a Line" do
    visit lines_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Line was successfully destroyed"
  end
end
