class HousesController < ApplicationController
  def show
    @house = House.find(params[:id])
  end

  def new
    @house = House.new()
  end

  def create
    @house = House.new(params[:id])
    @house.update(house_params)
    redirect_to house_path(@house)
  end

private

def house_params
  params.require(:house).permit(:address)
end

end
