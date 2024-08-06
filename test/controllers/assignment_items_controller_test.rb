require 'test_helper'

class AssignmentItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assignment_item = assignment_items(:one)
  end

  test "should get index" do
    get assignment_items_url
    assert_response :success
  end

  test "should get new" do
    get new_assignment_item_url
    assert_response :success
  end

  test "should create assignment_item" do
    assert_difference('AssignmentItem.count') do
      post assignment_items_url, params: { assignment_item: { assignment_id: @assignment_item.assignment_id, rating: @assignment_item.rating, remarks: @assignment_item.remarks, work_item: @assignment_item.work_item } }
    end

    assert_redirected_to assignment_item_url(AssignmentItem.last)
  end

  test "should show assignment_item" do
    get assignment_item_url(@assignment_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_assignment_item_url(@assignment_item)
    assert_response :success
  end

  test "should update assignment_item" do
    patch assignment_item_url(@assignment_item), params: { assignment_item: { assignment_id: @assignment_item.assignment_id, rating: @assignment_item.rating, remarks: @assignment_item.remarks, work_item: @assignment_item.work_item } }
    assert_redirected_to assignment_item_url(@assignment_item)
  end

  test "should destroy assignment_item" do
    assert_difference('AssignmentItem.count', -1) do
      delete assignment_item_url(@assignment_item)
    end

    assert_redirected_to assignment_items_url
  end
end
