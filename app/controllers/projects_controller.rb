class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new()
  end

  def create
    @project = Project.new(params[:id])
    @project.update(project_params)
    redirect_to project_path(@project)
  end

private

  def project_params
    params.require(:project).permit(:name, :status)
  end

end
