class PostIndicesController < ApplicationController

  def index
    @indices = PostIndex.paginate(:page => params[:page], :per_page => 8).order("index_reg_no ASC").where("index_reg_no > 20000")
  end

  def show
    # Don't need it know. Maybe will need to diplay something later
  end

  def new
    @post_index = PostIndex.new
    @cities = City.all.offset(1)
    @indices = PostIndex.all
    @last = PostIndex.last.index_reg_no + 1
  end

  def create
    @post_index = PostIndex.new(index_params)
  if @post_index.save
    redirect_to(:action => 'index')
  else
    render('new')
  end
  end

  def edit
    @post_index = PostIndex.find(params[:id])
    @cities = City.all.offset(1)
  end

  def update
    @post_index = PostIndex.find(params[:id])
    if @post_index.update_attributes(index_params)
      redirect_to(:action => 'index')
    else
      @cities = City.all.offset(1)
      render('edit')
    end
  end

  def delete
      @post_index = PostIndex.find(params[:id])
    end

    def destroy
      @post_index = PostIndex.find(params[:id])
      @post_index.destroy
      redirect_to(:action => 'index')
    end


  private

  def index_params
     params.require(:post_index).permit(:city_id, :post_index, :index_reg_no)
  end
end
