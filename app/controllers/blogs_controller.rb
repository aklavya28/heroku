
class BlogsController < ApplicationController
  before_action :set_blog , only: [:show, :edit, :update, :destory]
  def index
      @blogs = Blog.all
      # return render json: @blogs
  end

  def show

  end

  def new
    @blog = Blog.new
  end
  def create
    @blog = Blog.new(blog_params)
    if
      flash[:notice] ="Post saved Successfully"
      @blog.save
      redirect_to blog_path(@blog)
    else
      render 'new'
    end
  end
  def edit

  end
  def update

    if
      @blog.update(blog_params)
      flash[:notice] = "Post updated successfully."
      redirect_to @blog
      else
        render 'edit'
    end

  end
  def destroy

    @blog.destroy
     redirect_to blogs_path
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end
  def blog_params
    params.require(:blog).permit(:title, :description)
  end





end
