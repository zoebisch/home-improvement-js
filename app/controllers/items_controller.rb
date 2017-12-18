class ItemsController < ApplicationController

  def index
    @project = Project.find(params[:project_id])
    @project.build_items_list
  end

end
