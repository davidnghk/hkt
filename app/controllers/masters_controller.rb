class MastersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_master, only: [:show, :edit, :update, :destroy]

  # GET /masters
  # GET /masters.json
  def index
    if params[:parent_id]
      @master = Master.where(:parent_id => params[:parent_id])
    else
      @masters = Master.order("parent_id asc")
    end
    respond_to do |format|
      format.html
      format.csv { send_data @masters.to_csv }
    end
  end

  # GET /masters/1
  # GET /masters/1.json
  def show
  end

  # GET /masters/new
  def new
    if params[:parent_id]
      @master = Master.new(:parent_id => params[:parent_id])
    else
      @master = Master.new
    end
  end

  # GET /masters/1/edit
  def edit
  end

  # POST /masters
  # POST /masters.json
  def create
    @master = current_team.masters.new(master_params)

    respond_to do |format|
      if @master.save
        if @master.parent_id?
          format.html { redirect_to @master.parent, notice: 'Master was successfully created.' }
        else
          format.html { redirect_to @master, notice: 'Master was successfully created.' }
        end
        format.json { render :show, status: :created, location: @master } 
      else
        format.html { render :new }
        format.json { render json: @master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /masters/1
  # PATCH/PUT /masters/1.json
  def update

    respond_to do |format|
      if @master.update(master_params)
        if @master.parent_id?
          format.html { redirect_to @master.parent, notice: 'Product was successfully created.' }
        else
          format.html { redirect_to @master, notice: 'Product was successfully created.' }
        end
        format.json { render :show, status: :ok, location: @master }
      else
        format.html { render :edit }
        format.json { render json: @master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /masters/1
  # DELETE /masters/1.json
  def destroy
    @master.destroy
    @parent = @master.parent 
    respond_to do |format|
      format.html { redirect_to @parent, notice: 'Master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_master
      @master = Master.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def master_params
      params.require(:master).permit(:code, :name, :local_name, :parent_id, :setting1, 
      :description, :icon, :param1)
    end
end
