class BlogController < ApplicationController

  def index
    puts "index"
    @posts = Blog.all
  end

  def new
    puts "new"
    @blog = Blog.new
  end

  def create
    @blog = Blog.new params[:blog]
    if @blog.valid?
      @blog.save
      flash[:notice] = "Successfully created post"
      redirect_to :action=>'index'
    else
      render :new
    end
  end

end
