class LandlordsController < ApplicationController

  def index
    @landlords = Landlord.all
  end

  def new
    @landlord = Landlord.new
  end

  def create
    @landlord = Landlord.new(landlord_params)

    if @landlord.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @landlord = Landlord.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def landlord_params
    params.require(:landlord).permit(:name, :street, :city, :zip, :phone, :email)
  end

end
