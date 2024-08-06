class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    if params[:parent_id]
      @product = Product.where(:parent_id => params[:parent_id])
    else
      @products = Product.where("parent_id is null").order("parent_id asc")
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  def new
    if params[:parent_id]
      @product = Product.new(:parent_id => params[:parent_id])
    else
      @product = Product.new
    end
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        if @product.parent_id?
          format.html { redirect_to @product.parent, notice: 'Product was successfully created.' }
        else
          format.html { redirect_to @product, notice: 'Product was successfully created.' }
        end
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @parent = @product.parent 
    @product.destroy
    respond_to do |format|
      format.html { redirect_to @parent, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    Product.import(params[:file])
    redirect_to products_path, notice: "Products imported."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:code, :name, :local_name, :unit_rate, :unit_type_id, 
      :description, :unit_name, :parent_id)
    end
end
