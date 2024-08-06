class LinesController < ApplicationController
  before_action :set_line, only: [:show, :edit, :update, :destroy]

  # GET /lines
  # GET /lines.json
  def index
    @lines = @linable.lines

    #@search = Product.search(params[:q])
    #@products = @search.result
    #@products = @products.order("code asc").page(params[:page]).per(10)
  end

  # GET /lines/1
  # GET /lines/1.json
  def show
  end

  # GET /lines/new
  def new
    @line = @lineable.lines.new # Line.new
  end

  # GET /lines/1/edit
  def edit
  end

  # POST /lines
  # POST /lines.json
  def create
    # @line = Line.new(line_params)
    @line = @lineable.lines.new(line_params)
    @lineable.save

    respond_to do |format|
      if @line.save
        format.html { redirect_to @lineable, notice: 'Line was successfully created.' }
        format.json { render :show, status: :created, location: @line }
      else
        format.html { render :new }
        format.json { render json: @line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lines/1
  # PATCH/PUT /lines/1.json
  def update

    respond_to do |format|
      if @line.update(line_params)
        format.js {}
        format.html { redirect_to sale_lines_path(@lineable), data: { turbolinks: false },  notice: 'Line was successfully updated.' }
        format.json { render :show, status: :ok, location: @line }
      else
        format.js {}
        format.html { render :edit }
        format.json { render json: @line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lines/1
  # DELETE /lines/1.json
  def destroy
    @lineable = @line.lineable
    @line.destroy
    respond_to do |format|
      format.html { redirect_to sale_lines_path(@lineable), notice: 'Line was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line
      @line = Line.find(params[:id])
    end

    def set_lineable
      resource, id = request.path.split('/')[1, 2]
      @lineable = resource.singularize.classify.constantize.find(id)
    end

    # Only allow a list of trusted parameters through.
    def line_params
      params.require(:line).permit(:lineable_id, :lineable_type, :product_id, :method, 
      :description, :percentage, :discount, :price, :unit, :thing, :quantity)
    end
end
