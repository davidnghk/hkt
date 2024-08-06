class AssignmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_assignment, only: [:show, :edit, :update, :destroy, :assign, :acknowledge, 
    :start, :finish, :accept, :reject, :approve, :complete, :ask, :askRequestInfo, 
    :cancel]

  def ask
    @assignment.ask! 
    create_log
    redirect_to @assignment 
  end 

  def reject 
    @assignment.reject!
    create_log
    @assignment.end_datetime = Time.zone.now
    #Ticket.create(recipient: @assignment.worker_user, user: current_user, 
    #    notifiable_id: @assignment.id, notifiable_type: 'Assignment', 
    #    content: "#{Time.now.to_formatted_s(:db)}  #{@assignment.work.name} Job : #{@assignment.ref_no} is rejected. ")
    redirect_to @assignment 
  end
  
  def askRequestInfo 
    @assignment.askRequestInfo!
    create_log
    (@assignment.operation_team.users - [current_user]).each do |member|
      Ticket.create(actor: current_user, user: member, 
          notifiable_id: @assignment.id, notifiable_type: 'Assignment', 
          message: "Request Info of #{@assignment.work.name} Job : #{@assignment.ref_no} is asked. ")
    end
    redirect_to @assignment 
  end

  def cancel
    @assignment.cancel!
    create_log
    @assignment.end_datetime = Time.zone.now
    redirect_to @assignment
  end

  def approve
    @assignment.approve! 
    create_log
    redirect_to @assignment 
  end

  def assign
    @assignment.assign!
    create_log
    (@assignment.operation_team.users - [current_user]).each do |member|
      Ticket.create(actor: current_user, user: member, 
          notifiable_id: @assignment.id, notifiable_type: 'Assignment', 
          message: "#{@assignment.work.name} Job : #{@assignment.ref_no} is approved. ")
    end
    redirect_to @assignment 
  end

  def askWorkInfo
    @assignment.askWorkInfo!
    create_log
    (@assignment.operation_team.users - [current_user]).each do |member|
      Ticket.create(actor: current_user, user: member, 
          notifiable_id: @assignment.id, notifiable_type: 'Assignment', 
          message: "Work Info of #{@assignment.work.name} Job : #{@assignment.ref_no} is asked. ")
    end
    redirect_to @assignment 
  endTicket.

  def acknowledge 
    @assignment.acknowledge!
    create_log
    redirect_to @assignment 
  end

  def start
    @assignment.start!
    create_log
    (@assignment.operation_team.users - [current_user]).each do |member|
      Ticket.create(actor: current_user, user: member, 
          notifiable_id: @assignment.id, notifiable_type: 'Assignment', 
          message: "#{@assignment.work.name} Job : #{@assignment.ref_no} has started. ")
    end
    redirect_to @assignment  
  end

  def complete 
    @assignment.end_datetime = Time.zone.now
    @assignment.complete!
    create_log
    (@assignment.operation_team.users - [current_user]).each do |member|
      Ticket.create(actor: current_user, user: member, 
          notifiable_id: @assignment.id, notifiable_type: 'Assignment', 
          message: "#{@assignment.work.name} Job : #{@assignment.ref_no} is completed. ")
    end
    redirect_to @assignment  
  end

  def appraise 
    @assignment.appraise!
    create_log
    (@assignment.operation_team.users - [current_user]).each do |member|
      Ticket.create(actor: current_user, user: member, 
          notifiable_id: @assignment.id, notifiable_type: 'Assignment', 
          message: "#{@assignment.work.name} Job : #{@assignment.ref_no} is apprasied. ")
    end
    redirect_to @assignment 
  end

  def calendar
        @assignments = current_team.assignments.where(start_datetime: params[:start]..params[:end])
  end

  def index
    if params[:commit] == "Search" or params[:commit] == "Summary" or params[:commit] == "Report"
      @search = Assignment.search(params[:q])
      @assignments = @search.result
      @assignments = Assignment.where(" start_datetime >= ? ", Date.yesterday ) unless params[:q]
    else
      #@assignments = Assignment.where(team: current_team)
      if params[:status].present?
        @assignments = current_team.assignments.where(status: params[:status])
      else
        @assignments = current_team.assignments
      end
      @assignments = @assignments.includes(:location, :work ).order("start_datetime DESC").page(params[:page]).per(10)
    end
  end

  def show
    @photos = @assignment.photos
    respond_to do |format|
      format.html {}
      format.pdf do
        html = render_to_string(template: 'assignments/show.pdf.erb', layout: 'layouts/application.pdf.erb')
        pdf = WickedPdf.new.pdf_from_string(html)
        send_data(pdf, filename: 'assignment.pdf', type: 'application/pdf', disposition: :attachment)
      end
    end 
  end

  # GET /assignments/new
  def new
    if params[:parent_id]
      @assignment = Assignment.new(:parent_id => params[:parent_id])
    else
      @assignment = Assignment.new
    end
    if params[:client_id].present?
      @assignment.client_id = params[:client_id]
    end
  end

  # GET /assignments/1/edit
  def edit

  end

  # POST /assignments
  # POST /assignments.json
  def create
    @assignment = Assignment.new(assignment_params)
    @assignment.team = current_team
    @assignment.status = 0
    if @assignment.origin == 'Calendar' 
      @assignment.start_datetime = @assignment.date_range[0..15].to_datetime
      @assignment.due_datetime   = @assignment.date_range[19..34].to_datetime
      @assignment.end_datetime   = @assignment.date_range[19..34].to_datetime
    else
      @assignment.start_datetime ||= (Time.now + 30.minutes).beginning_of_hour
      @assignment.due_datetime ||= (Time.now + 90.minutes).beginning_of_hour
      @assignment.end_datetime ||= (Time.now + 90.minutes).beginning_of_hour
      from_calendar = false
    end
    @team_assignment = TeamAssignment.new(team: current_team, assignment: @assignment)
 
    respond_to do |format|
      if @assignment.save
        @team_assignment.save
        if  @assignment.origin == 'Calendar'
          format.html { redirect_to calendar_path, notice: 'Assignment was successfully created.' }
        else
          format.html { redirect_to @assignment, notice: 'Assignment was successfully created.' }
        end        
        format.json { render :show, status: :created, location: @assignment }
      else
        format.html { render :new }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assignments/1
  # PATCH/PUT /assignments/1.json
  def update
    respond_to do |format|
      if @assignment.update(assignment_params)
        if @assignment.origin == 'Calendar'
          format.html { redirect_to calendar_path }
        else
          format.html { redirect_to @assignment, notice: 'Assignment was successfully created.' } 
        end
        format.json { render :show, status: :ok, location: @assignment }
      else
        format.html { render :edit }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  def calendar_update
    if  @assignment.origin == '*** Calendar_update Calendar'
      puts "fromCalendar"
    end
    respond_to do |format|
      if @assignment.update(assignment_params)
        if @assignment.origin == 'Calendar'
          format.html { redirect_to calendar_path }
        else
          format.html { redirect_to @assignment, notice: 'Assignment was successfully updated.' }
        end
        format.json { render :show, status: :ok, location: @assignment }
      else
        format.html { render :edit }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    @assignment.destroy
    if @assignment.date_range.blank?
      respond_to do |format|
        format.html { redirect_to assignments_path(:commit => "Search"), notice: 'Assignment was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      format.html { redirect_to calendar_path }
    end
  end

  def delete_uploadfile
    @uploadfile = ActiveStorage::Attachment.find(params[:id])
    @uploadfile.purge_later
    redirect_back(fallback_location: request.referer) 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    def create_log
      AssignmentLog.create(action: @assignment.aasm_state, assignment_id: @assignment.id, 
        actor: current_user, team_id: @assignment.team_id,
        operation_team_id: @assignment.operation_team_id)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def assignment_params
      params.require(:assignment).permit(:work_id, :location_id, :team_id, :operation_team_id, :name, 
        :start_datetime, :due_datetime, :end_datetime, :status, :aasm_state, :aasm_supplement, 
        :ref_no, :ancestry, :user_ref, :parent_id, :comments, :color, :date_range, :address, :source,
        :origin, :longitude, :altitude, :latitude, :block_hash, :nonce, :bimfile, :delete_bimfile,  
        :client_id, :site_id, :our_ref,
        photos: [], uploadfiles: [])
    end
end
