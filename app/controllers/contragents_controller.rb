class ContragentsController < ApplicationController

  def index
    @contragents = Contragent.paginate(:page => params[:page], :per_page => 8).order("cont_reg_no ASC").where("cont_reg_no > 50000")
    @types = ContType.all
  end

  def show
    @contragent = Contragent.find(params[:id])
    @bank_accounts = BankAccount.where(:contragent_id => @contragent.id)
  end

  def new
    @contragent = Contragent.new
    @types = ContType.all
    @last = Contragent.last.cont_reg_no + 1
  end

  def create
    @contragent = Contragent.new(cont_params)
  if @contragent.save
    redirect_to(:action => 'index')
  else
    render('new')
  end
  end


  def edit
    @contragent = Contragent.find(params[:id])
    @types = ContType.all
  end

  def update
    @contragent = Contragent.find(params[:id])
    if @contragent.update_attributes(cont_params)
      redirect_to(:action => 'index')
    else
      @types = ContType.all
      render('edit')
    end
  end


  private

  def cont_params
    params.require(:contragent).permit(:cont_reg_no, :cont_name, :cont_type_id)
  end

end
