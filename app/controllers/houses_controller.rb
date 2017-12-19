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
    errors_handler(new_house_path)
  end

  def edit
    @house = House.find(params[:id])
  end

  def update
    @house = House.find(params[:id])
    @house.update(house_params)
    errors_handler(edit_house_path)
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

def errors_handler(from_path)
  if @house.errors.messages != {}
    flash[:error] = "The address #{params[:house][:address] } " + @house.errors.messages[:address][0]
    redirect_to from_path
  else
    redirect_to house_path(@house)
  end
end

end
