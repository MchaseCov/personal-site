class ProjectsController < ApplicationController
  require 'json'
  require 'net/http'

  def index
    @projects = Project.all.visible.order(updated_at: :desc)
  end

  def show
    @project = Project.find(params[:id])
    return unless @project.title == 'Hotwire Scaffold Generator Gem'

    fetch_gem_info
  end

  def fetch_gem_info
    url = 'https://rubygems.org/api/v2/rubygems/hotwire_scaffold_generator/versions/1.0.1.json'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    result = JSON.parse(response)
    @count = result['downloads']
  end
end
