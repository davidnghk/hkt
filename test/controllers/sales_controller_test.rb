require 'test_helper'

class SalesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sale = sales(:one)
  end

  test "should get index" do
    get sales_url
    assert_response :success
  end

  test "should get new" do
    get new_sale_url
    assert_response :success
  end

  test "should create sale" do
    assert_difference('Sale.count') do
      post sales_url, params: { sale: { aasm_state: @sale.aasm_state, attention: @sale.attention, authorised_date: @sale.authorised_date, authorised_person: @sale.authorised_person, category: @sale.category, client_id: @sale.client_id, client_ref: @sale.client_ref, our_ref: @sale.our_ref, phone: @sale.phone, project_site: @sale.project_site, sale_date: @sale.sale_date, team_id: @sale.team_id, total_amount: @sale.total_amount } }
    end

    assert_redirected_to sale_url(Sale.last)
  end

  test "should show sale" do
    get sale_url(@sale)
    assert_response :success
  end

  test "should get edit" do
    get edit_sale_url(@sale)
    assert_response :success
  end

  test "should update sale" do
    patch sale_url(@sale), params: { sale: { aasm_state: @sale.aasm_state, attention: @sale.attention, authorised_date: @sale.authorised_date, authorised_person: @sale.authorised_person, category: @sale.category, client_id: @sale.client_id, client_ref: @sale.client_ref, our_ref: @sale.our_ref, phone: @sale.phone, project_site: @sale.project_site, sale_date: @sale.sale_date, team_id: @sale.team_id, total_amount: @sale.total_amount } }
    assert_redirected_to sale_url(@sale)
  end

  test "should destroy sale" do
    assert_difference('Sale.count', -1) do
      delete sale_url(@sale)
    end

    assert_redirected_to sales_url
  end
end
