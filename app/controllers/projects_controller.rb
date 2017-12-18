class ProjectsController < ApplicationController

  def index
    if params[:house_id]
      @house = House.find(params[:house_id])
      @projects = @house.projects
    else
      @projects = Project.all
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new()
    if params[:house_id]
      @project.house = House.find(params[:house_id])
    else
      @project.house = House.find(params[:id].to_i)
    end

    @materials = Material.all
    @project.build_items_list
  end

  def create
    @project = Project.new()
    @project.update(project_params)
    redirect_to project_path(@project)
  end

  def update
    @project = Project.find(params[:id])
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
    params.require(:project).permit(:name, :status, :house_id, materials: [:name, :quantity_on_hand], items_attributes: [:material_id, :quantity])
  end

end
