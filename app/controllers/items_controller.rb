class ItemsController < ApplicationController

  def index
    @project = Project.find(params[:id])
    @project.build_items_list
  end

end
