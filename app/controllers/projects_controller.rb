class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new()
    @project.house = House.find(params[:id].to_i)
    @materials = Material.all
    Material.all.size.times {@project.items.build}
  end

  def create
    @project = Project.new()
    # @project = Project.create(name: params[:project][:name])
    #@house = House.find(params[:project][:house_id])
    #@house.projects.new()
    # @project.house = @house
    # @project.save
    @project.update(project_params)
    # @project.update(project_params)
    binding.pry
    redirect_to project_path(@project)
  end

private

  def project_params
    #params.require(:project).permit(:name, :status)
    params.require(:project).permit(:name, :status, :house_id, items_attributes: [:material, :quantity])
  end

end
