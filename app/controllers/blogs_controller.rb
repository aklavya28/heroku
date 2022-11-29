
class BlogsController < ApplicationController

  before_action :set_blog , only: [:show, :edit, :update, :destory]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
      @blogs = Blog.paginate(:page => params[:page], :per_page => 10)
      # return render json: @blogs
  end

  def show

  end

  def new
    @blog = Blog.new
  end
  def create
    # return render json: current_user

    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
      flash[:notice] = "Post saved Successfully"
      redirect_to blogs_path(@blog)
    else
      render 'new'
    end
  end


  def edit

  end
  def update

    if@blog.update(blog_params)
      @blog.user_id = current_user.id
      @blog.save
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
    params.require(:blog).permit(:title, :description, :user_id, category_ids: [])
  end
  def require_same_user
    if current_user != @blog.user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own article"
      redirect_to @blog
    end
  end




end
