require 'test_helper'

class TaskMaterialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task_material = task_materials(:one)
  end

  test "should get index" do
    get task_materials_url
    assert_response :success
  end

  test "should get new" do
    get new_task_material_url
    assert_response :success
  end

  test "should create task_material" do
    assert_difference('TaskMaterial.count') do
      post task_materials_url, params: { task_material: { cost: @task_material.cost, material_id: @task_material.material_id, quantity: @task_material.quantity, task_id: @task_material.task_id } }
    end

    assert_redirected_to task_material_url(TaskMaterial.last)
  end

  test "should show task_material" do
    get task_material_url(@task_material)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_material_url(@task_material)
    assert_response :success
  end

  test "should update task_material" do
    patch task_material_url(@task_material), params: { task_material: { cost: @task_material.cost, material_id: @task_material.material_id, quantity: @task_material.quantity, task_id: @task_material.task_id } }
    assert_redirected_to task_material_url(@task_material)
  end

  test "should destroy task_material" do
    assert_difference('TaskMaterial.count', -1) do
      delete task_material_url(@task_material)
    end

    assert_redirected_to task_materials_url
  end
end
