class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new()
    @materials = Material.all
    Material.all.size.times {@project.items.build}
    #binding.pry
  end

  def create
    binding.pry
    @project = Project.new(params[:id])
    @project.update(project_params)
    redirect_to project_path(@project)
  end

private

  def project_params
    #params.require(:project).permit(:name, :status)
    params.require(:project).permit(:name, :status, items_attributes: [:material, :quantity])
  end

end
