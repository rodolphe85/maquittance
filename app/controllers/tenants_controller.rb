class TenantsController < ApplicationController
  def index
    @tenants = Tenant.all
  end

  def new
    @tenant = Tenant.new
  end

  def create
     @tenant = Tenant.new(tenant_params)

    if @tenant.save
      redirect_to tenants_url
    else
      render 'new'
    end
  end

  def show
    @tenant = Tenant.find(params[:id])
  end

  def edit
    @tenant = Tenant.find(params[:id])
  end

  def update
    @tenant = Tenant.find(params[:id])

    if @tenant.update_attributes(tenant_params)
      flash[:success] = "locataire mis à jour!"
      redirect_to tenants_url
    else
      render :edit
    end
  end

  def destroy
    Tenant.find(params[:id]).destroy
    flash[:success] = "Tenant deleted"
    redirect_to tenants_url
  end

  private

  def tenant_params
    params.require(:tenant).permit(:name, :street, :city, :zip, :email, :phone, :property_id)
  end
end
