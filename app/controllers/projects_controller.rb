class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new()
    @project.house = House.find(params[:id].to_i)
    @materials = Material.all
    @project.build_items_list
  end

  def create
    @project = Project.new()
    binding.pry
    @project.update(project_params)
    redirect_to project_path(@project)
  end

  def update
    #binding.pry
    @project = Project.find(params[:id])
  #  binding.pry
    @project.update(project_params)
    redirect_to project_path(@project)
  end

  def destroy
    @project = Project.find(params[:id])
    @house = @project.house
    @project.delete
    @project.save
    redirect_to house_path(@house)
  end

private

  def project_params
    params.require(:project).permit(:name, :status, :house_id, items_attributes: [:material_id, :quantity], materials: [:name, :quantity_on_hand])
  end

end
