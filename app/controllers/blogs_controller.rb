class BlogsController < ApplicationController

  before_action :authenticate_user! ,only:[:new]

  def index
  	@blogs = Blog.all
  end

  def show
  end

  def new
  	@blog = Blog.new
  end

  def create
  	@blog = Blog.new(blog_params)
  	if @blog.save
      redirect_to blogs_path
    else
     render 'new'
    end
  end

  private
    def blog_params
      params.require(:blog).permit(:title, :category, :body)
    end
end
