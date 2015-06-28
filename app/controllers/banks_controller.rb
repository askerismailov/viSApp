class BanksController < ApplicationController


  def index
    @banks = Bank.paginate(:page => params[:page], :per_page => 8).order("id ASC")
    @indices = PostIndex.all
    @cities = City.all
  end

  def show
    # Don't need it know. Maybe will need to diplay something later
  end

  def new
    @bank = Bank.new
    @indices = PostIndex.all
  end

  def create
    @bank = Bank.new(bank_params)
  if @bank.save
    flash[:notice] = "Bank created successfully!"
    redirect_to(:action => 'index')
  else
    render('new')
  end
  end

  def edit
    @bank = Bank.find(params[:id])
    @indices = PostIndex.all
  end

  def update
    @bank = Bank.find(params[:id])
    if @bank.update_attributes(bank_params)
      flash[:notice] = "Bank updated successfully!"
      redirect_to(:action => 'index')
    else
      @indices = PostIndex.all
      render('edit')
    end
  end

  def delete
      @bank = Bank.find(params[:id])
    end

    def destroy
      @bank = Bank.find(params[:id])
      @bank.destroy
      flash[:notice] = "Bank deleted successfully!"
      redirect_to(:action => 'index')
    end

  private

  def bank_params
     params.require(:bank).permit(:bank_name, :post_index_id, :mfo_no, :cor_account)
  end


end
