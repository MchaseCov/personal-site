class BlogsController < ApplicationController
  # GET /blogs
  def index
    @blogs = Blog.all.order(created_at: :desc)
  end

  # GET /blogs/1
  def show
    @blog = Blog.find(params[:id])
  end
end
