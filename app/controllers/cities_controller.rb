class CitiesController < ApplicationController

  def index
    @cities = City.all
  end

  def show
    # @subject = Subject.find(params[:id])
  end

  def new
    @city = City.new
    # @subject_count = Subject.count + 1
    # @newSubject = Subject.count + 1
  end

  def create
    @city = City.new(city_params)
    if @city.save
      # flash[:notice] = "Subject created successfully!"
      redirect_to(:action => 'index')
    else
      # @subject_count = Subject.count + 1
      # @newSubject = Subject.count + 1
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(subject_params)
      flash[:notice] = "Subject updated successfully!"
      redirect_to(:action => 'index')
    else
      @subject_count = Subject.count
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Subject destroyed successfully!"
    redirect_to(:action => 'index')
  end

  private

  def city_params
     params.require(:city).permit(:city_name)
  end

end
