class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
  end

  def create
     @property = Property.new(property_params)

    if @property.save
      redirect_to properties_url
    else
      render 'new'
    end
  end

  def show
    @property = Property.find(params[:id])
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])

    if @property.update_attributes(property_params)
      flash[:success] = "bien mis à jour!"
      redirect_to root_url
    else
      render :edit
    end
  end

  def destroy
    Property.find(params[:id]).destroy
    flash[:success] = "Property deleted"
    redirect_to properties_url
  end

  private

  def property_params
    params.require(:property).permit(:name, :street, :city, :zip, :rent, :charges, :landlord_id)
  end
end
