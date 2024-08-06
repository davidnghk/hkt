class SalesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_sale, only: [:show, :edit, :update, :destroy, :cancel, :copy, :supersede, 
    :mail, :confirm, :pend, :authorise, :deliver]

  def copy
    @new_sale = @sale.dup
    @new_sale.parent_id = nil  
    @new_sale.remarks = @sale.remarks
    @new_sale.aasm_state = "prepared" 
    @new_sale.save
    @sale.lines.each do | line |
      new_line = line.dup
      new_line.lineable = @new_sale
      new_line.save
    end

    @sale.terms.each do | saleterm |
      new_saleterm = SalesTerm.new  
      new_saleterm.term_id = saleterm.id 
      new_saleterm.sale  = @new_sale
      new_saleterm.save
    end

    redirect_to @new_sale 
  end 

  def supersede
    @new_sale = @sale.dup
    @new_sale.parent_id = @sale.id 
    @new_sale.remarks = @sale.remarks
    if @sale.aasm_state = "prepared"   
      @sale.cancel! 
    end
    @new_sale.aasm_state = "prepared" 
    @new_sale.save
    @sale.lines.each do | line |
      new_line = line.dup
      new_line.lineable = @new_sale
      new_line.save
    end

    @sale.terms.each do | saleterm |
      new_saleterm = SalesTerm.new  
      new_saleterm.term_id = saleterm.id 
      new_saleterm.sale  = @new_sale
      new_saleterm.save
    end

    redirect_to @new_sale 
  end 

  def mail
    @sale.mail! 
    redirect_to @sale 
  end 

  def confirm
    @sale.confirm! 
    redirect_to @sale 
  end 

  def cancel
    @sale.cancel! 
    redirect_to @sale 
  end 

  def pend
    @sale.pend! 
    redirect_to @sale 
  end 

  def authorise
    @sale.authorise! 
    @sale.authorised_date = Date.today
    @sale.save
    redirect_to @sale 
  end 

  def deliver
    @sale.deliver! 
    redirect_to @sale 
  end 

  def show
    #@salepath = @sale.our_ref
    #@salepath = (request.base_url + request.fullpath).from(0).to(-5)
    @qrcode = RQRCode::QRCode.new(@sale.our_ref)
    @svg = @qrcode.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 4
      )
    @photos = @sale.photos
    respond_to do |format|
      format.html {}
      format.pdf do
        pdf = WickedPdf.new.pdf_from_string(
          render_to_string(template: 'sales/show.pdf.erb',  layout: 'layouts/application.pdf.erb'),
          margin: { top: 48, bottom: 64},
          header: {
            content: render_to_string(        
               template: 'shared/pdf_header.html.erb',
               layout: 'layouts/application.pdf.erb'
            )
          },
          footer: {
            content: render_to_string(
              template: 'shared/pdf_footer.html.erb',
              layout: 'layouts/application.pdf.erb'
            )
          }
        )
        send_data(pdf, filename: "#{@sale.our_ref}.pdf", type: 'application/pdf', disposition: :attachment)
      end
    end
  end

  def index
    if params[:commit] == "Search" or params[:commit] == "Summary" or params[:commit] == "Report"
      @search = Sale.search(params[:q])
      @sales = @search.result
      @sales = Sale.where(" sale_date >= ? ", Date.yesterday - 6 ) unless params[:q]
      @count = @sales.count
      if @count > 0
        @start_date = @sales.last.sale_date
        @end_date = @sales.first.sale_date
      end

      if @count > 0 and params[:commit] == "Summary" 
        pdf = WickedPdf.new.pdf_from_string(
          render_to_string(template: 'sales/index.pdf.erb', layout: 'layouts/application.pdf.erb'),
          orientation: 'Landscape',  
          margin: { top: 25, bottom: 8},
          header: {
            content: render_to_string(        
            template: 'shared/pdf_quotation_list_header.html.erb',
            layout: 'layouts/application.pdf.erb'
            )
          },
        )
        send_data(pdf, filename: 'quotation.pdf', type: 'application/pdf', disposition: :attachment )
      end
    else
      if params[:aasm_state].present?
        @sales = current_team.sales.where(aasm_state: params[:aasm_state])
      else
        @sales = current_team.sales
      end
    end

  end

  def new
    @sale = Sale.new
    if params[:client_id].present?
      @sale.client_id = params[:client_id]
    end
    @sale.team = current_team
    if params[:category] ==  "Invoice"
      @sale.category = "Invoice"
    else
      @sale.category = "Quotation"
    end
    @sale.sale_date = Date.today
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(sale_params)
    @sale.phone = @sale.client.phone if @sale.client_id? and @sale.phone.nil?
    @sale.address = @sale.client.address if @sale.client_id? and @sale.phone.nil?
    @sale.project_site = @sale.client.site if @sale.client_id? and @sale.phone.nil?

    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    term_details = ""
    @sale.term_ids.each do |term|
      term_details = term_details + Term.find(term).name.gsub(/\n/, '<br/>') 
    end
    @sale.remarks = term_details

    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
      @photoable = @sale
      @photos = @photoable.photos 
    end

    # Only allow a list of trusted parameters through.
    def sale_params
      params.require(:sale).permit(:team_id, :category, :sale_date, :our_ref, :client_ref, 
        :client_id, :project_site, :attention, :phone, :total_amount, :authorised_person, 
        :authorised_date, :aasm_state, :remarks, :term_id, :term_details, :address, 
        :ship_client_id, :ship_project_site, :ship_attention, :ship_phone, :fax, :email, :cc, 
        :ship_contact, :contact, :ship_to, :ship_to_address, :discount, :authorised_person2,
        :uploadfile, term_ids: [], product_ids: [], photos: [] )
    end
end
