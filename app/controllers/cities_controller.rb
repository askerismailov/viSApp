class CitiesController < ApplicationController

  def index
    @cities = City.paginate(:page => params[:page], :per_page => 5)
  end

  def show

  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
  if @city.save

    redirect_to(:action => 'index')
  else
    render('new')
  end
  end

  def edit
  end

  def update

  end

  def delete
  end

  def destroy
  end

  private

  def city_params
     params.require(:city).permit(:city_name)
  end

end
