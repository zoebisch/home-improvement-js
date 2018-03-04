class MaterialsController < ApplicationController

  def index
    @materials = Material.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @materials.to_json }
    end
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
      render json: @material, status: 201
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
    @material.delete
    @material.save
    redirect_to materials_path
  end

private

  def material_params
    params.require(:material).permit(:name, :quantity_on_hand)
  end

end
