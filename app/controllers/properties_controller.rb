class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end

  def new
    @landlord = Landlord.find(params[:landlord_id])
    @property = @landlord.properties.build
  end

  def create
     @landlord = Landlord.find(params[:landlord_id])
     @property = @landlord.properties.create(property_params)

     if @property.save
      redirect_to @landlord
     else
      redirect_to root_path
    end
  end

  def show
    @landlord = Landlord.find(params[:landlord_id])
    @property = @landlord.properties.find(params[:property_id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def property_params
    params.require(:property).permit(:name, :street, :city, :zip, :rent, :charges)
  end
end
