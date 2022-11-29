class TestingsController < ApplicationController
  def index
    @testing = Testing.all
  end
  def new

    @testing = Testing.new

  end
  def show
    @testing = Testing.find(params[:id])
  end

  def create
    @testing = Testing.new(testing_params)
    if @testing.save
      flash[:notice] = "data saved successfully"
      redirect_to testings_path
      else
        render 'new'
    end

  end
  def edit
    @testing = Testing.find(params[:id])
  end
  def update

    @testing = Testing.find(params[:id])
    if@testing.update(testing_params)
      @testing.save
      flash[:notice] = "testing updated successfully."
      redirect_to @testing
      else
        render 'edit'
    end

  end


  private
  def testing_params
    params.require(:testing).permit(:title, :body)
  end


end
