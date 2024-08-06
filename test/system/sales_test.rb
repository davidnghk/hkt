require "application_system_test_case"

class SalesTest < ApplicationSystemTestCase
  setup do
    @sale = sales(:one)
  end

  test "visiting the index" do
    visit sales_url
    assert_selector "h1", text: "Sales"
  end

  test "creating a Sale" do
    visit sales_url
    click_on "New Sale"

    fill_in "Aasm state", with: @sale.aasm_state
    fill_in "Attention", with: @sale.attention
    fill_in "Authorised date", with: @sale.authorised_date
    fill_in "Authorised person", with: @sale.authorised_person
    fill_in "Category", with: @sale.category
    fill_in "Client", with: @sale.client_id
    fill_in "Client ref", with: @sale.client_ref
    fill_in "Our ref", with: @sale.our_ref
    fill_in "Phone", with: @sale.phone
    fill_in "Project site", with: @sale.project_site
    fill_in "Sale date", with: @sale.sale_date
    fill_in "Team", with: @sale.team_id
    fill_in "Total amount", with: @sale.total_amount
    click_on "Create Sale"

    assert_text "Sale was successfully created"
    click_on "Back"
  end

  test "updating a Sale" do
    visit sales_url
    click_on "Edit", match: :first

    fill_in "Aasm state", with: @sale.aasm_state
    fill_in "Attention", with: @sale.attention
    fill_in "Authorised date", with: @sale.authorised_date
    fill_in "Authorised person", with: @sale.authorised_person
    fill_in "Category", with: @sale.category
    fill_in "Client", with: @sale.client_id
    fill_in "Client ref", with: @sale.client_ref
    fill_in "Our ref", with: @sale.our_ref
    fill_in "Phone", with: @sale.phone
    fill_in "Project site", with: @sale.project_site
    fill_in "Sale date", with: @sale.sale_date
    fill_in "Team", with: @sale.team_id
    fill_in "Total amount", with: @sale.total_amount
    click_on "Update Sale"

    assert_text "Sale was successfully updated"
    click_on "Back"
  end

  test "destroying a Sale" do
    visit sales_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sale was successfully destroyed"
  end
end
