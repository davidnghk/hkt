class FoldersController < ApplicationController
  before_action :set_folder, only: [:show, :edit, :update, :destroy]

  # GET /folders
  # GET /folders.json
  def index
    @folders = @foldable.folders 
  end

  # GET /folders/1
  # GET /folders/1.json
  def show
  end

  # GET /folders/new
  def new
    @folder = @foldable.folders.new
  end

  # GET /folders/1/edit
  def edit
  end

  # POST /folders
  # POST /folders.json
  def create
    # @folder = Folder.new(folder_params)
    @folder = @foldable.folders.new(folder_params)
    @foldable.save

    respond_to do |format|
      if @folder.save
        format.html { redirect_to @foldable, notice: 'Folder was successfully created.' }
        format.json { render :show, status: :created, location: @folder }
      else
        format.html { render :new }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /folders/1
  # PATCH/PUT /folders/1.json
  def update
    respond_to do |format|
      if @folder.update(folder_params)
        format.html { redirect_to sale_folders_path(@foldable), notice: 'Folder was successfully updated.' }
        format.json { render :show, status: :ok, location: @folder }
      else
        format.html { render :edit }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /folders/1
  # DELETE /folders/1.json
  def destroy
    @foldable = @folder.foldable
    @folder.destroy
    respond_to do |format|
      format.html { redirect_to @foldable, notice: 'Folder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_folder
      @folder = Folder.find(params[:id])
    end

    def set_foldable
      resource, id = request.path.split('/')[1, 2]
      @foldable = resource.singularize.classify.constantize.find(id)
    end

    # Only allow a list of trusted parameters through.
    def folder_params
      params.require(:folder).permit(:foldable_id, :foldable_type, :code, :name, :active)
    end
end
