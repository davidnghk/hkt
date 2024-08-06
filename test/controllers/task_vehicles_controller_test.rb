require 'test_helper'

class TaskVehiclesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task_vehicle = task_vehicles(:one)
  end

  test "should get index" do
    get task_vehicles_url
    assert_response :success
  end

  test "should get new" do
    get new_task_vehicle_url
    assert_response :success
  end

  test "should create task_vehicle" do
    assert_difference('TaskVehicle.count') do
      post task_vehicles_url, params: { task_vehicle: { driver_id: @task_vehicle.driver_id, end_km: @task_vehicle.end_km, parking_expense: @task_vehicle.parking_expense, run_km: @task_vehicle.run_km, start_km: @task_vehicle.start_km, task_id: @task_vehicle.task_id, tunnel_expense: @task_vehicle.tunnel_expense, vehicle_id: @task_vehicle.vehicle_id } }
    end

    assert_redirected_to task_vehicle_url(TaskVehicle.last)
  end

  test "should show task_vehicle" do
    get task_vehicle_url(@task_vehicle)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_vehicle_url(@task_vehicle)
    assert_response :success
  end

  test "should update task_vehicle" do
    patch task_vehicle_url(@task_vehicle), params: { task_vehicle: { driver_id: @task_vehicle.driver_id, end_km: @task_vehicle.end_km, parking_expense: @task_vehicle.parking_expense, run_km: @task_vehicle.run_km, start_km: @task_vehicle.start_km, task_id: @task_vehicle.task_id, tunnel_expense: @task_vehicle.tunnel_expense, vehicle_id: @task_vehicle.vehicle_id } }
    assert_redirected_to task_vehicle_url(@task_vehicle)
  end

  test "should destroy task_vehicle" do
    assert_difference('TaskVehicle.count', -1) do
      delete task_vehicle_url(@task_vehicle)
    end

    assert_redirected_to task_vehicles_url
  end
end
