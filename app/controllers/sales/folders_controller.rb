class Sales::FoldersController < FoldersController
    before_action :load_foldable

  def index
    @folders = @foldable.folders

  end
  
  # PATCH/PUT /folders/1.json
  def update
    respond_to do |format|
      if @folder.update(folder_params)
        format.js {}
        format.html { redirect_to @folder, notice: 'Folder was successfully updated.' }
        format.json { render :show, status: :ok, location: @folder }
      else
        format.html { render :edit }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
      @folder = Folder.find(params[:id])
      @folder.destroy

      respond_to do |format|
        format.html { redirect_to @foldable, notice: 'Folder was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
  
      def load_foldable
        @foldable = Sale.find(params[:sale_id])
      end
  end