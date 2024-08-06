class SaleItemsController < ApplicationController
  before_action :set_sale_item, only: [:show, :edit, :update, :destroy]

  # GET /sale_items
  # GET /sale_items.json
  def index
    @sale_items = SaleItem.all
  end

  # GET /sale_items/1
  # GET /sale_items/1.json
  def show
  end

  # GET /sale_items/new
  def new
    if params[:sale_id]
      @sale_item = SaleItem.new(:sale_id => params[:sale_id])
    else
      @sale_item = SaleItem.new
    end
  end

  # GET /sale_items/1/edit
  def edit
  end

  # POST /sale_items
  # POST /sale_items.json
  def create
    @sale_item = SaleItem.new(sale_item_params)
    @sale_item.price = @sale_item.work_item.unit_rate
    if @sale_item.quantity?
      @sale_item.amount = @sale_item.quantity * @sale_item.price
    end
    sale = @sale_item.sale 

    respond_to do |format|
      if @sale_item.save
        sale.total_amount = sale.calc_amount
        sale.save
        format.html { redirect_to @sale_item.sale, notice: 'Sale item was successfully created.' }
        format.json { render :show, status: :created, location: @sale_item }
      else
        format.html { render :new }
        format.json { render json: @sale_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sale_items/1
  # PATCH/PUT /sale_items/1.json
  def update
    @sale_item.price = @sale_item.work_item.unit_rate
    sale = @sale_item.sale
    respond_to do |format|
      if @sale_item.update(sale_item_params)
        sale.total_amount = sale.calc_amount
        sale.save
        format.html { redirect_to @sale_item.sale, notice: 'Sale item was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale_item }
      else
        format.html { render :edit }
        format.json { render json: @sale_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sale_items/1
  # DELETE /sale_items/1.json
  def destroy
    @sale = @sale_item.sale
    @sale_item.destroy
    @sale.total_amount = @sale.calc_amount
    @sale.save

    respond_to do |format|
      format.html { redirect_to @sale, notice: 'Sale item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale_item
      @sale_item = SaleItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sale_item_params
      params.require(:sale_item).permit(:sale_id, :work_item_id, :price, :quantity, :amount)
    end
end
