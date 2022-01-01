class ProjectsController < ApplicationController
  require 'json'
  require 'net/http'
  include RubyGemHelper

  def index
    @projects = Project.all.visible.order(updated_at: :desc)
  end

  def show
    @project = Project.find(params[:id])
    return unless @project.title == 'Hotwire Scaffold Generator Gem'

    fetch_gem_info
  end
end
