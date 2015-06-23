class BanksController < ApplicationController

  
  def index
    @banks = Bank.paginate(:page => params[:page], :per_page => 8).order("bank_reg_no ASC").where("bank_reg_no > 30000")
    @indices = PostIndex.all
    @cities = City.all
  end

  def show
    # Don't need it know. Maybe will need to diplay something later
  end

  def new
    @bank = Bank.new
    @indices = PostIndex.all.offset(1)
    @last = Bank.last.bank_reg_no + 1
  end

  def create
    @bank = Bank.new(bank_params)
  if @bank.save
    redirect_to(:action => 'index')
  else
    render('new')
  end
  end

  def edit
    @bank = Bank.find(params[:id])
    @indices = PostIndex.all.offset(1)
  end

  def update
    @bank = Bank.find(params[:id])
    if @bank.update_attributes(bank_params)
      redirect_to(:action => 'index')
    else
      @indices = PostIndex.all.offset(1)
      render('edit')
    end
  end

  def delete
      @bank = Bank.find(params[:id])
    end

    def destroy
      @bank = Bank.find(params[:id])
      @bank.destroy
      redirect_to(:action => 'index')
    end

  private

  def bank_params
     params.require(:bank).permit(:bank_name, :post_index_id, :mfo_no, :cor_account, :bank_reg_no)
  end


end
