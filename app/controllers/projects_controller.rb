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
    binding.pry
    @project = Project.new()
    if params[:house_id]
      @project.house = House.find(params[:house_id])
    else
      binding.pry
      #TODO this may not be necessary since we are only accessing new project through house?
      @project.house = House.find(params[:id].to_i)
    end

    @materials = Material.all
    @project.build_items_list
  end

  def create
    binding.pry
    @project = Project.new()
    @project.update(project_params)
    project_errors_handler(new_house_project_path(@project.house))
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    project_errors_handler(project_path(@project))
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

  def project_errors_handler(from_path)
    if @project.errors.messages != {}
      flash[:error] = "The project #{params[:project][:name] } " + @project.errors.messages[:name][0]
      redirect_to from_path
    else
      redirect_to project_path(@project)
    end
  end

end
