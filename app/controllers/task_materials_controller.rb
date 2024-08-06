class TaskMaterialsController < ApplicationController
  before_action :set_task_material, only: [:show, :edit, :update, :destroy]

  # GET /task_materials
  # GET /task_materials.json
  def index
    @task_materials = TaskMaterial.all
  end

  # GET /task_materials/1
  # GET /task_materials/1.json
  def show
  end

  # GET /task_materials/new
  def new
    @task_material = TaskMaterial.new
  end

  # GET /task_materials/1/edit
  def edit
  end

  # POST /task_materials
  # POST /task_materials.json
  def create
    @task_material = TaskMaterial.new(task_material_params)

    respond_to do |format|
      if @task_material.save
        format.html { redirect_to @task_material.task, notice: 'Task material was successfully created.' }
        format.json { render :show, status: :created, location: @task_material }
      else
        format.html { render :new }
        format.json { render json: @task_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_materials/1
  # PATCH/PUT /task_materials/1.json
  def update
    respond_to do |format|
      if @task_material.update(task_material_params)
        format.html { redirect_to @task_material, notice: 'Task material was successfully updated.' }
        format.json { render :show, status: :ok, location: @task_material }
      else
        format.html { render :edit }
        format.json { render json: @task_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_materials/1
  # DELETE /task_materials/1.json
  def destroy
    @task = @task_material.task
    @task_material.destroy
    respond_to do |format|
      format.html { redirect_to @task, notice: 'Task material was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_material
      @task_material = TaskMaterial.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_material_params
      params.require(:task_material).permit(:task_id, :material_id, :quantity, :cost)
    end
end
