class TaskStaffsController < ApplicationController
  before_action :set_task_staff, only: [:show, :edit, :update, :destroy]

  # GET /task_staffs
  # GET /task_staffs.json
  def index
    @task_staffs = TaskStaff.all
  end

  # GET /task_staffs/1
  # GET /task_staffs/1.json
  def show
  end

  # GET /task_staffs/new
  def new

    @task_staff = TaskStaff.new
    @task_staff.task_id = params["task_id"]

  end

  # GET /task_staffs/1/edit
  def edit
  end

  # POST /task_staffs
  # POST /task_staffs.json
  def create
    @task_staff = TaskStaff.new(task_staff_params)

    respond_to do |format|
      if @task_staff.save
        format.html { redirect_to @task_staff.task, notice: 'Task staff was successfully created.' }
        format.json { render :show, status: :created, location: @task_staff }
      else
        format.html { render :new }
        format.json { render json: @task_staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_staffs/1
  # PATCH/PUT /task_staffs/1.json
  def update
    respond_to do |format|
      if @task_staff.update(task_staff_params)
        format.html { redirect_to @task_staff, notice: 'Task staff was successfully updated.' }
        format.json { render :show, status: :ok, location: @task_staff }
      else
        format.html { render :edit }
        format.json { render json: @task_staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_staffs/1
  # DELETE /task_staffs/1.json
  def destroy
    @task = @task_staff.task
    @task_staff.destroy

    respond_to do |format|
      format.html { redirect_to @task, notice: 'Task staff was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_staff
      @task_staff = TaskStaff.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_staff_params
      params.require(:task_staff).permit(:task_id, :task_role_id, :staff_id, :start_time, :end_time)
    end
end
