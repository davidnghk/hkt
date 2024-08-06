class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def complete
    @task.complete! 
    redirect_to @task 
  end 

  def cancel
    @task.cancel! 
    redirect_to @task 
  end 

  def index
      @search = Task.search(params[:q])
      @tasks = @search.result
      @tasks = Task.where(" task_date >= ? ", Date.yesterday - 6 ) unless params[:q]
  end

  def show
    @fee = Master.find(79).name
    respond_to do |format|
      format.html {}
      format.pdf do
        pdf = WickedPdf.new.pdf_from_string(
          render_to_string(template: 'tasks/show.pdf.erb',  layout: 'layouts/application.pdf.erb'),
          margin: { top: 85, bottom: 80},
          header: {
            content: render_to_string(        
               template: 'shared/pdf_task_header.html.erb',
               layout: 'layouts/application.pdf.erb'
            )
          },
          footer: {
            content: render_to_string(
              template: 'shared/pdf_task_footer.html.erb',
              layout: 'layouts/application.pdf.erb'
            )
          }
        )
        send_data(pdf, filename: "Job-#{@task.id}.pdf", type: 'application/pdf', disposition: :attachment)
      end
    end
  end



  # GET /tasks/new
  def new
    @task = Task.new

    @task.task_date = Date.today
    @task.start_time = DateTime.now
    @task.end_time = DateTime.current.midnight
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.start_time = @task.task_date + 9.hours
    @task.end_time = @task.task_date + 9.hours
    @task.all_day = true 
    
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import 
    Task.import(params[:file])
    redirect_to tasks_path, notice: "Tasks imported."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end
 
    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:category, :task_date, :our_ref, :customer_ref, :request_ref, 
        :client_id, :laboratory_id, :sample, :contact, :phone, :fax, :aasm_state, :no_of_sample,
        :all_day, :start_time, :end_time, :title,
        :sample_received_date, :test_start_date, :test_end_date, :report_drafted_date,
        :report_typed_date, :report_checked_date, :report_signed_date, :report_dispatched_date,
        :report_no, :quotation_no, :invoice_no, :invoice_date, :invoice_amount, :account_signoff_date, 
        :laboratory_signoff_date, :location, :name, :object_type,
        task_materials_attributes: [:_destroy, :id, :material_id, :quantity, :cost, :category, :booking_date], 
        task_staffs_attributes: [:_destroy, :id, :task_role_id, :staff_id, :start_time, :end_time, :category, :booking_date], 
        task_vehicles_attributes: [:_destroy, :id, :vehicle_id, :driver_id, :start_km, :end_km, :run_km, :tunnel_expense, :parking_expense, :booking_date], 
        staff_ids: [])
    end
end
