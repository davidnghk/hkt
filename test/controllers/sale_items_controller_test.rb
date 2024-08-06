require 'test_helper'

class SaleItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sale_item = sale_items(:one)
  end

  test "should get index" do
    get sale_items_url
    assert_response :success
  end

  test "should get new" do
    get new_sale_item_url
    assert_response :success
  end

  test "should create sale_item" do
    assert_difference('SaleItem.count') do
      post sale_items_url, params: { sale_item: { Sale_id: @sale_item.Sale_id, amount: @sale_item.amount, price: @sale_item.price, quantity: @sale_item.quantity, work_item_id: @sale_item.work_item_id } }
    end

    assert_redirected_to sale_item_url(SaleItem.last)
  end

  test "should show sale_item" do
    get sale_item_url(@sale_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_sale_item_url(@sale_item)
    assert_response :success
  end

  test "should update sale_item" do
    patch sale_item_url(@sale_item), params: { sale_item: { Sale_id: @sale_item.Sale_id, amount: @sale_item.amount, price: @sale_item.price, quantity: @sale_item.quantity, work_item_id: @sale_item.work_item_id } }
    assert_redirected_to sale_item_url(@sale_item)
  end

  test "should destroy sale_item" do
    assert_difference('SaleItem.count', -1) do
      delete sale_item_url(@sale_item)
    end

    assert_redirected_to sale_items_url
  end
end
