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
    binding.pry
    @material = Material.new()
    @material.update(material_params)
    material_errors_handler(new_material_path)
  end

  def edit
    @material = Material.find(params[:id])
  end

  def update
    binding.pry
    @material = Material.find(params[:id])
    @material.update(material_params)
    material_errors_handler(edit_material_path)
  end

  def destroy
    @material = Material.find(params[:id])
    @material.delete
    @material.save
    redirect_to materials_path
  end

  def remove_multiple_materials
     binding.pry
  end

private

  def material_params
    params.require(:material).permit(:name, :quantity_on_hand)
  end

  def material_errors_handler(from_path)
    if @material.errors.messages != {}
      flash[:error] = "The material #{params[:material][:name] } " + @material.errors.messages[:name][0]
      redirect_to from_path
    else
      redirect_to material_path(@material)
    end
  end

end
