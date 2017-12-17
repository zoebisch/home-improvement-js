class MaterialsController < ApplicationController

  def show
    @material = Material.find(params[:id])
  end

  def new
    @material = Material.new()
  end

  def create
    @material = Material.new()
    @material.update(material_params)
    redirect_to materials_path
  end


  private

    def material_params
      params.require(:material).permit(:name, :quantity_on_hand)
    end
end
