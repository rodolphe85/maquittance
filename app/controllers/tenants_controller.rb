class TenantsController < ApplicationController
  def index
    @tenants = Tenant.all
  end

  def new
    @proper = Landlord.find(params[:landlord_id])
    @property = @landlord.properties.build
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def tenant_params
    params.require(:tenant).permit(:name, :street, :city, :zip, :email, :phone)
  end
end
