class ProjectsController < ApplicationController


  def insufficient_quantity
    @insufficient_quantity = Project.materials_shortage
    binding.pry
  end

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
      #TODO Currently there is no access through clickable means therefore redirect
      #@project.house = House.find(params[:id].to_i) would need to modify new.html.erb to include assiging a house
      redirect_to houses_path
    end

    @materials = Material.all
    @project.build_items_list
  end

  def create
    @project = Project.new()
    @project.update(project_params)
    project_errors_handler(new_house_project_path(@project.house))
  end

  def edit
    @project = Project.find(params[:id])
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
      flash[:error] = "The project name #{params[:project][:name] } " + @project.errors.messages[:name][0]
      redirect_to from_path
    else
      redirect_to project_path(@project)
    end
  end

end
