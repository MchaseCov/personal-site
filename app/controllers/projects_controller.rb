class ProjectsController < ApplicationController
  def index
    @projects = Project.all.visible.order(created_at: :desc)
  end

  def show
    @project = Project.find(params[:id])
  end
end
