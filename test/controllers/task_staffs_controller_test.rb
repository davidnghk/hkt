require 'test_helper'

class TaskStaffsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task_staff = task_staffs(:one)
  end

  test "should get index" do
    get task_staffs_url
    assert_response :success
  end

  test "should get new" do
    get new_task_staff_url
    assert_response :success
  end

  test "should create task_staff" do
    assert_difference('TaskStaff.count') do
      post task_staffs_url, params: { task_staff: { end_time: @task_staff.end_time, staff_id: @task_staff.staff_id, start_time: @task_staff.start_time, task_id: @task_staff.task_id, task_role_id: @task_staff.task_role_id } }
    end

    assert_redirected_to task_staff_url(TaskStaff.last)
  end

  test "should show task_staff" do
    get task_staff_url(@task_staff)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_staff_url(@task_staff)
    assert_response :success
  end

  test "should update task_staff" do
    patch task_staff_url(@task_staff), params: { task_staff: { end_time: @task_staff.end_time, staff_id: @task_staff.staff_id, start_time: @task_staff.start_time, task_id: @task_staff.task_id, task_role_id: @task_staff.task_role_id } }
    assert_redirected_to task_staff_url(@task_staff)
  end

  test "should destroy task_staff" do
    assert_difference('TaskStaff.count', -1) do
      delete task_staff_url(@task_staff)
    end

    assert_redirected_to task_staffs_url
  end
end
