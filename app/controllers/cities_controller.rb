class CitiesController < ApplicationController

  def index
    @cities = City.paginate(:page => params[:page], :per_page => 8).order("city_reg_no ASC")

  end

  def show
    # Don't need it know. Maybe will need to diplay something later
  end

  def new
    @city = City.new
    @last = City.last.city_reg_no + 1
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
      redirect_to(:action => 'index')
    end


  private

  def city_params
     params.require(:city).permit(:city_name, :city_reg_no)
  end

end
