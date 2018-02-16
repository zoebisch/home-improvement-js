class MaterialsController < ApplicationController

  def index
    @material = Material.new()
    @materials = Material.all
  end

  def show
    @material = Material.find(params[:id])
  end

  def new
     # raise "stop".inspect
    @material = Material.new()
    respond_to do |format|
      format.html { render :new}
      format.json { render json: @material }
    end
  end

  def create
    binding.pry
    @material = Material.new()
    @material.update(material_params)

    if @material.errors.messages != {}
      render 'new'
    else
      redirect_to material_path(@material)
    end

  end

  def edit
    @material = Material.find(params[:id])
  end

  def update
    binding.pry
    @material = Material.find(params[:id])
    @material.update(material_params)

    if @material.errors.messages != {}
      render 'edit'
    else
      redirect_to material_path(@material)
    end

  end

  def destroy
    @material = Material.find(params[:id])
    @material.delete
    @material.save
    redirect_to materials_path
  end


private

  def material_params
    params.require(:material).permit(:name, :quantity_on_hand)
  end

end
