class MaterialsController < ApplicationController

  def index
    @material = Material.new()
    @materials = Material.all
  end

  def show
    @material = Material.find(params[:id])
  end

  def new
    @material = Material.new()
  end

  def create
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

    if @material.items.any?
      flash[:error] = "Cannot delete material, it is still being used!"
      redirect_to materials_path
    else
      @material.delete
      @material.save
      redirect_to materials_path
    end

  end

private

  def material_params
    params.require(:material).permit(:name, :quantity_on_hand)
  end

end
