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
    @blog.user_id = current_user.id
  	if @blog.save
      redirect_to blogs_path
    else
     render 'new'
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path
  end

  private
    def blog_params
      params.require(:blog).permit(:title, :category, :body)
    end
end
