class AssignmentItemsController < ApplicationController
  before_action :set_assignment_item, only: [:show, :edit, :update, :destroy]

  # GET /assignment_items
  # GET /assignment_items.json
  def index
    @assignment_items = AssignmentItem.all
  end

  # GET /assignment_items/1
  # GET /assignment_items/1.json
  def show
  end

  # GET /assignment_items/new
  def new
    if params[:assignment_id]
      @assignment_item = AssignmentItem.new(:assignment_id => params[:assignment_id])
    else
      @assignment_item = AssignmentItem.new
    end
  end

  # GET /assignment_items/1/edit
  def edit
  end

  # POST /assignment_items
  # POST /assignment_items.json
  def create
    @assignment_item = AssignmentItem.new(assignment_item_params)

    respond_to do |format|
      if @assignment_item.save
        format.html { redirect_to @assignment_item.assignment, notice: 'Assignment item was successfully created.' }
        format.json { render :show, status: :created, location: @assignment_item }
      else
        format.html { render :new }
        format.json { render json: @assignment_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assignment_items/1
  # PATCH/PUT /assignment_items/1.json
  def update
    respond_to do |format|
      if @assignment_item.update(assignment_item_params)
        format.html { redirect_to @assignment_item.assignment, notice: 'Assignment item was successfully updated.' }
        format.json { render :show, status: :ok, location: @assignment_item }
      else
        format.html { render :edit }
        format.json { render json: @assignment_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignment_items/1
  # DELETE /assignment_items/1.json
  def destroy
    @assignment = @assignment_item.assignment
    @assignment_item.destroy
    respond_to do |format|
      format.html { redirect_to @assignment, notice: 'Assignment item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment_item
      @assignment_item = AssignmentItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def assignment_item_params
      params.require(:assignment_item).permit(:assignment_id, :work_item_id, :rating, 
          :serial_number, :remarks)
    end
end
