require "application_system_test_case"

class TicketsTest < ApplicationSystemTestCase
  setup do
    @ticket = tickets(:one)
  end

  test "visiting the index" do
    visit tickets_url
    assert_selector "h1", text: "Tickets"
  end

  test "creating a Ticket" do
    visit tickets_url
    click_on "New Ticket"

    fill_in "Actor", with: @ticket.actor_id
    fill_in "Message", with: @ticket.message
    fill_in "No", with: @ticket.no
    fill_in "Notifiable", with: @ticket.notifiable_id
    fill_in "Notifiable type", with: @ticket.notifiable_type
    fill_in "User", with: @ticket.user_id
    click_on "Create Ticket"

    assert_text "Ticket was successfully created"
    click_on "Back"
  end

  test "updating a Ticket" do
    visit tickets_url
    click_on "Edit", match: :first

    fill_in "Actor", with: @ticket.actor_id
    fill_in "Message", with: @ticket.message
    fill_in "No", with: @ticket.no
    fill_in "Notifiable", with: @ticket.notifiable_id
    fill_in "Notifiable type", with: @ticket.notifiable_type
    fill_in "User", with: @ticket.user_id
    click_on "Update Ticket"

    assert_text "Ticket was successfully updated"
    click_on "Back"
  end

  test "destroying a Ticket" do
    visit tickets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ticket was successfully destroyed"
  end
end
