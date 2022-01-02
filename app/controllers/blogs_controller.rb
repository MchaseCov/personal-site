class BlogsController < ApplicationController
  # GET /blogs
  def index
    @blogs = Blog.all
  end

  # GET /blogs/1
  def show
    @blog = Blog.find(params[:id])
  end
end
