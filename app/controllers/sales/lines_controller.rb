class Sales::LinesController < LinesController
    before_action :load_lineable

  def index
    @lines = @lineable.lines

  end
  
  # PATCH/PUT /lines/1.json
  def update
    respond_to do |format|
      if @line.update(line_params)
        format.js {}
        format.html { redirect_to @line, notice: 'Line was successfully updated.' }
        format.json { render :show, status: :ok, location: @line }
      else
        format.html { render :edit }
        format.json { render json: @line.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
      @line = Line.find(params[:id])
      @line.destroy

      respond_to do |format|
        format.html { redirect_to @lineable, notice: 'Line was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
  
      def load_lineable
        @lineable = Sale.find(params[:sale_id])
      end
  end