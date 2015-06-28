class PostIndicesController < ApplicationController



  def index
    @indices = PostIndex.paginate(:page => params[:page], :per_page => 8).order("id ASC")
  end

  def show
    # Don't need it know. Maybe will need to diplay something later
  end

  def new
    @post_index = PostIndex.new
    @cities = City.all
  end

  def create
    @post_index = PostIndex.new(index_params)
  if @post_index.save
    flash[:notice] = "Post index created successfully!"
    redirect_to(:action => 'index')
  else
    render('new')
  end
  end

  def edit
    @post_index = PostIndex.find(params[:id])
    @cities = City.all
  end

  def update
    @post_index = PostIndex.find(params[:id])
    if @post_index.update_attributes(index_params)
      flash[:notice] = "Post index updated successfully!"
      redirect_to(:action => 'index')
    else
      @cities = City.all
      render('edit')
    end
  end

  def delete
      @post_index = PostIndex.find(params[:id])
    end

    def destroy
      @post_index = PostIndex.find(params[:id])
      @post_index.destroy
      flash[:notice] = "Post index deleted successfully!"

      redirect_to(:action => 'index')
    end


  private

  def index_params
     params.require(:post_index).permit(:city_id, :post_index)
  end
end
