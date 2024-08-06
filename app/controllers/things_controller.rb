class ThingsController < ApplicationController
  before_action :set_thing, only: [:show, :edit, :update, :destroy]

  # GET /things
  # GET /things.json
  def index
    @things = Thing.all
  end

  # GET /things/1
  # GET /things/1.json
  def show
  end

  # GET /things/new
  def new
    @thing = Thing.new
  end

  # GET /things/1/edit
  def edit
  end

  # POST /things
  # POST /things.json
  def create

    #@thing = @thingable.things.new(thing_params) 

    @thing = Thing.where("code is null and thingable_type = ? and thingable_id = ?", "Container", params[:container_id]).
    order(:set_no, :mark).first

    @thing.code = thing_params[:code]


    respond_to do |format|
      if thing_params[:code].length > 1
        if @thing.save
          format.html { redirect_to @thingable.collection, notice: 'Thing was successfully created.' }
  #        format.html { redirect_to @thingable, notice: 'Thing was successfully created.' }
          format.json { render :show, status: :created, location: @thing }
        else
          format.html { redirect_to @thingable.collection, notice: 'Thing was not created.'}
          format.json { render json: @thing.errors, status: :unprocessable_entity }
        end
      end
    end
  end


  # PATCH/PUT /things/1
  # PATCH/PUT /things/1.json
  def update
    respond_to do |format|
      if @thing.update(thing_params)
        format.html { redirect_to @thing, notice: 'Thing was successfully updated.' }
        format.json { render :show, status: :ok, location: @thing }
      else
        format.html { render :edit }
        format.json { render json: @thing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /things/1
  # DELETE /things/1.json
  def destroy
    @thing.destroy
    respond_to do |format|
      format.html { redirect_to @thingable.collection, notice: 'Thing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thing
      @thing = Thing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def thing_params
      params.require(:thing).permit(:thingable_id, :thingable_type, :code, :cname, :local_name, 
        :category_id, :parent_id, :mark, :set_no)
    end
end
