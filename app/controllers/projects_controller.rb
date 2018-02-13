class ProjectsController < ApplicationController

  def insufficient_quantity
    @insufficient_quantity = Project.materials_shortage
  end

  def index
    if params[:house_id]
      @house = House.find(params[:house_id])
      render json: @house, status: 200
      binding.pry
      @projects = @house.projects
    else
      @projects = Project.all
      render json: @house, status: 200
      binding.pry
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
      redirect_to new_house_project_path(@project)
    end

    @materials = Material.all
    @project.build_items_list
  end

  def create
    @project = Project.new()
    @project.update(project_params)

    if @project.errors.messages != {}
      render 'new'
    else
      redirect_to project_path(@project)
    end

  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)

    if @project.errors.messages != {}
      render 'edit'
    else
      redirect_to project_path(@project)
    end

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
