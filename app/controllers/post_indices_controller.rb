class PostIndicesController < ApplicationController

  def index
    @indices = PostIndex.paginate(:page => params[:page], :per_page => 8).order("created_at ASC")
  end

  def show
    # Don't need it know. Maybe will need to diplay something later
  end

  def new
    @index = PostIndex.new
    @cities = City.all
    # @last = City.last.city_reg_no + 1
  end

  def create
    @index = PostIndex.new(index_params)
  if @index.save
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

  def index_params
     params.require(:post_index).permit(:city_id, :post_index)
  end
end
