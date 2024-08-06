class TaskVehiclesController < ApplicationController
  before_action :set_task_vehicle, only: [:show, :edit, :update, :destroy]

  # GET /task_vehicles
  # GET /task_vehicles.json
  def index
    @task_vehicles = TaskVehicle.all
  end

  # GET /task_vehicles/1
  # GET /task_vehicles/1.json
  def show
  end

  # GET /task_vehicles/new
  def new
    @task_vehicle = TaskVehicle.new
  end

  # GET /task_vehicles/1/edit
  def edit
  end

  # POST /task_vehicles
  # POST /task_vehicles.json
  def create
    @task_vehicle = TaskVehicle.new(task_vehicle_params)

    respond_to do |format|
      if @task_vehicle.save
        format.html { redirect_to @task_vehicle.task, notice: 'Task vehicle was successfully created.' }
        format.json { render :show, status: :created, location: @task_vehicle }
      else
        format.html { render :new }
        format.json { render json: @task_vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_vehicles/1
  # PATCH/PUT /task_vehicles/1.json
  def update
    respond_to do |format|
      if @task_vehicle.update(task_vehicle_params)
        format.html { redirect_to @task_vehicle, notice: 'Task vehicle was successfully updated.' }
        format.json { render :show, status: :ok, location: @task_vehicle }
      else
        format.html { render :edit }
        format.json { render json: @task_vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_vehicles/1
  # DELETE /task_vehicles/1.json
  def destroy
    @task = @task_vehicle.task
    @task_vehicle.destroy
    respond_to do |format|
      format.html { redirect_to @task, notice: 'Task vehicle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_vehicle
      @task_vehicle = TaskVehicle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_vehicle_params
      params.require(:task_vehicle).permit(:task_id, :vehicle_id, :driver_id, :start_km, :end_km, :run_km, :tunnel_expense, :parking_expense)
    end
end
