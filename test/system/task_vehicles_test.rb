require "application_system_test_case"

class TaskVehiclesTest < ApplicationSystemTestCase
  setup do
    @task_vehicle = task_vehicles(:one)
  end

  test "visiting the index" do
    visit task_vehicles_url
    assert_selector "h1", text: "Task Vehicles"
  end

  test "creating a Task vehicle" do
    visit task_vehicles_url
    click_on "New Task Vehicle"

    fill_in "Driver", with: @task_vehicle.driver_id
    fill_in "End km", with: @task_vehicle.end_km
    fill_in "Parking expense", with: @task_vehicle.parking_expense
    fill_in "Run km", with: @task_vehicle.run_km
    fill_in "Start km", with: @task_vehicle.start_km
    fill_in "Task", with: @task_vehicle.task_id
    fill_in "Tunnel expense", with: @task_vehicle.tunnel_expense
    fill_in "Vehicle", with: @task_vehicle.vehicle_id
    click_on "Create Task vehicle"

    assert_text "Task vehicle was successfully created"
    click_on "Back"
  end

  test "updating a Task vehicle" do
    visit task_vehicles_url
    click_on "Edit", match: :first

    fill_in "Driver", with: @task_vehicle.driver_id
    fill_in "End km", with: @task_vehicle.end_km
    fill_in "Parking expense", with: @task_vehicle.parking_expense
    fill_in "Run km", with: @task_vehicle.run_km
    fill_in "Start km", with: @task_vehicle.start_km
    fill_in "Task", with: @task_vehicle.task_id
    fill_in "Tunnel expense", with: @task_vehicle.tunnel_expense
    fill_in "Vehicle", with: @task_vehicle.vehicle_id
    click_on "Update Task vehicle"

    assert_text "Task vehicle was successfully updated"
    click_on "Back"
  end

  test "destroying a Task vehicle" do
    visit task_vehicles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Task vehicle was successfully destroyed"
  end
end
