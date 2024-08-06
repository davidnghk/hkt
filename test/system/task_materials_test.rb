require "application_system_test_case"

class TaskMaterialsTest < ApplicationSystemTestCase
  setup do
    @task_material = task_materials(:one)
  end

  test "visiting the index" do
    visit task_materials_url
    assert_selector "h1", text: "Task Materials"
  end

  test "creating a Task material" do
    visit task_materials_url
    click_on "New Task Material"

    fill_in "Cost", with: @task_material.cost
    fill_in "Material", with: @task_material.material_id
    fill_in "Quantity", with: @task_material.quantity
    fill_in "Task", with: @task_material.task_id
    click_on "Create Task material"

    assert_text "Task material was successfully created"
    click_on "Back"
  end

  test "updating a Task material" do
    visit task_materials_url
    click_on "Edit", match: :first

    fill_in "Cost", with: @task_material.cost
    fill_in "Material", with: @task_material.material_id
    fill_in "Quantity", with: @task_material.quantity
    fill_in "Task", with: @task_material.task_id
    click_on "Update Task material"

    assert_text "Task material was successfully updated"
    click_on "Back"
  end

  test "destroying a Task material" do
    visit task_materials_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Task material was successfully destroyed"
  end
end
