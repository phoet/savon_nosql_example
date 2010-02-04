class BlogController < ApplicationController

  def index
    puts "index"
  end

  def new
    puts "new"
    @blog = Blog.new
  end

  def create
    @blog = Blog.new params[:blog]
    if @blog.valid?
      flash[:notice] = "Successfully created post"
      render :index
    else
      render :new
    end
  end

end
