class CitiesController < ApplicationController

  # before_action :confirm_logged_in

  def index
    @cities = City.paginate(:page => params[:page], :per_page => 8).order("id ASC")
  end

  def show
    # Don't need it know. Maybe will need to diplay something later
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
  if @city.save
    flash[:notice] = "City created successfully!"
    redirect_to(:action => 'index')
  else
    render('new')
  end
  end

  def edit
    @city = City.find(params[:id])
  end

  def update
    @city = City.find(params[:id])
    if @city.update_attributes(city_params)
      flash[:notice] = "City updated successfully!"
      redirect_to(:action => 'index')
    else
      render('edit')
    end
  end

  def delete
      @city = City.find(params[:id])
    end

    def destroy
      @city = City.find(params[:id])
      @city.destroy
      flash[:notice] = "City deleted successfully!"
      redirect_to(:action => 'index')
    end


  private

  def city_params
     params.require(:city).permit(:city_name)
  end

end
