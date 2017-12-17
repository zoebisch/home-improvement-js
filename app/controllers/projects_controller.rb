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
    binding.pry
    @project = Project.find(params[:id])
    binding.pry
    @project.update(project_params)
    redirect_to project_path(@project)
  end

private

  def project_params
    #params.require(:project).permit(:name, :status)
    params.require(:project).permit(:name, :status, :house_id, items_attributes: [:material_id, :quantity])
  end

end
