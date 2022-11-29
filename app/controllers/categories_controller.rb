class CategoriesController < ApplicationController
  before_action :find_cat, only: [:show, :edit, :update]

  def index
    @category = Category.order(id: :desc)
  end
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category was successfully created"
      redirect_to categories_path
    else
      render 'new'
    end
  end
  def show
  end

  def edit
  end
  def update
    if @category.update(category_params)
      flash[:notice] = "category name changed successfully"
      redirect_to categories_path
      else
        render 'new'
    end
  end

  private
  def find_cat
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
