class InvoicesController < ApplicationController
   def index
    @invoices = Invoice.all
  end

  def new
    @invoice = Invoice.new
  end

  def create
     @invoice = Invoice.new(invoice_params)

    if @invoice.save
      redirect_to invoices_url
    else
      render 'new'
    end
  end

  def show
    @invoice = Invoice.find(params[:id])
    respond_to do |format|
     format.html
     format.pdf do
       render pdf: "quittance",
       template: "invoices/show.html.erb",
       layout: 'pdf.html'
     end
    end
  end

  def edit
    @invoice = Invoice.find(params[:id])
  end

  def update
    @invoice = Invoice.find(params[:id])

    if @invoice.update_attributes(invoice_params)
      flash[:success] = "quittance mise à jour!"
      redirect_to invoices_url
    else
      render :edit
    end
  end

  def destroy
    Invoice.find(params[:id]).destroy
    flash[:success] = "Invoice deleted"
    redirect_to invoices_url
  end

  private

  def invoice_params
    params.require(:invoice).permit(:title, :date, :from, :to, :content, :property_id, :tenant_id)
  end
end
