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
    if @house.errors.messages != {}
      binding.pry
      flash[:error] = "The address: #{params[:house][:address]} #{@house.errors.messages[:address][0]}"
      redirect_to new_house_path
    else
      redirect_to house_path(@house)
    end
  end

  def edit
    @house = House.find(params[:id])
  end

  def update
    @house = House.find(params[:id])
    @house.update(house_params)
    if @house.errors
      flash_error = "#{params[:house][:address] }" + @house.errors.messages[:address][0]
      redirect_to new_house_path
    end
    redirect_to house_path(@house)
  end

  def destroy
    @house = House.find(params[:id])
    @house.delete
    @house.save
    redirect_to houses_path
  end

private

def house_params
  params.require(:house).permit(:address)
end

end
