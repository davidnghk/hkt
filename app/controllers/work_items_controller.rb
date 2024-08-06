class WorkItemsController < ApplicationController
  before_action :set_work_item, only: [:show, :edit, :update, :destroy]

  # GET /work_items
  # GET /work_items.json
  def index
    @work_items = WorkItem.all
  end

  # GET /work_items/1
  # GET /work_items/1.json
  def show
  end

  # GET /work_items/new
  def new
    if params[:work_id]
      @work_item = WorkItem.new(:work_id => params[:work_id])
    else
      @work_item = WorkItem.new
    end
  end

  # GET /work_items/1/edit
  def edit
  end

  # POST /work_items
  # POST /work_items.json
  def create
    @work_item = WorkItem.new(work_item_params)

    respond_to do |format|
      if @work_item.save
        format.html { redirect_to @work_item.work, notice: 'Work item was successfully created.' }
        format.json { render :show, status: :created, location: @work_item }
      else
        format.html { render :new }
        format.json { render json: @work_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_items/1
  # PATCH/PUT /work_items/1.json
  def update
    respond_to do |format|
      if @work_item.update(work_item_params)
        format.html { redirect_to @work_item.work, notice: 'Work item was successfully updated.' }
        format.json { render :show, status: :ok, location: @work_item }
      else
        format.html { render :edit }
        format.json { render json: @work_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_items/1
  # DELETE /work_items/1.json
  def destroy
    @work = @work_item.work
    @work_item.destroy
    respond_to do |format|
      format.html { redirect_to @work, notice: 'Work item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_item
      @work_item = WorkItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def work_item_params
      params.require(:work_item).permit(:work_id, :code, :name, :local_name, :unit_type_id, :unit_rate, 
        :description, :heading, :parent_id)
    end
end
