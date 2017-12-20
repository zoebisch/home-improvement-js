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
      render 'new'
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
    if @house.errors.messages != {}
      render 'edit'
    else
      redirect_to house_path(@house)
    end
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
