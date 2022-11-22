class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  def index
    @user = User.all
  end

  def new
    @user = User.new
    # return render json: @user

  end
  def show
    @blogs = @user.blogs.paginate(:page => params[:page], :per_page => 10)
    # return render json: @user
  end

  def create
    @user = User.new(user_params)
    # byebug
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "welcome to alfa blog"
      redirect_to blogs_path
    else
      render 'new'
    end

end
def edit
end
def update
  if @user.update(user_params)
    flash[:notice] = "Your account information was successfully updated"
    redirect_to root_path
  else

    render 'edit'
  end
end

private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
