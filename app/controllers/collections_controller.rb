class CollectionsController < ApplicationController
  before_action :set_collection, only: [:close, :show, :edit, :update, :destroy]

  def close
    @collection.close!
    @collection.save
    redirect_to @collection
  end 

  def index
    @search = Collection.search(params[:q])
    @collections = @search.result
    @collections = Collection.where(" received_date >= ? ", Date.yesterday - 3 )  unless params[:q] 

    respond_to do |format|
      format.html
      format.csv { send_data @collections.to_csv }
      format.xls  { headers["Content-Disposition"] = "attachment; filename=\"collections.xls\"" }
    end
  end

  # GET /collections/1
  # GET /collections/1.json
  def show
  end

  # GET /collections/new
  def new
    @collection = Collection.new
  end

  # GET /collections/1/edit
  def edit
  end

  # POST /collections
  # POST /collections.json
  def create
    @collection = Collection.new(collection_params)

    respond_to do |format|
      if @collection.save
        format.html { redirect_to @collection, notice: 'Collection was successfully created.' }
        format.json { render :show, status: :created, location: @collection }
      else
        format.html { render :new }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collections/1
  # PATCH/PUT /collections/1.json
  def update
    respond_to do |format|
      if @collection.update(collection_params)
        format.html { redirect_to @collection, notice: 'Collection was successfully updated.' }
        format.json { render :show, status: :ok, location: @collection }
      else
        format.html { render :edit }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collections/1
  # DELETE /collections/1.json
  def destroy
    @collection.destroy
    respond_to do |format|
      format.html { redirect_to collections_url, notice: 'Collection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import 
    Collection.import(params[:file])
    redirect_to collections_path, notice: "Collections imported."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection
      @collection = Collection.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def collection_params
      params.require(:collection).permit(:customer_contract_no, :request_ref, :location, :title)
    end
end
