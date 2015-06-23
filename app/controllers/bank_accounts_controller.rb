class BankAccountsController < ApplicationController


  def index
    @bank_accounts = BankAccount.paginate(:page => params[:page], :per_page => 8).order("acc_reg_no ASC").where("acc_reg_no > 40000")
    @indices = PostIndex.all
    @cities = City.all
  end


def new
  @bank_account = BankAccount.new
  @contragent = Contragent.find(params[:id])
  @banks = Bank.all.offset(1)
  @last = BankAccount.last.acc_reg_no + 1
end

def create
  @bank_account = BankAccount.new(acc_params)
  @contragent = Contragent.find(params[:id])
  @last = BankAccount.last.acc_reg_no + 1
if @bank_account.save
  redirect_to(:controller => 'contragents', :action => 'show', :id => @contragent.id)
else
  render('new')
end
end



def edit
  @bank_account = BankAccount.find(params[:id])
  @banks = Bank.all.offset(1)
  @last = BankAccount.last.acc_reg_no + 1
  @contragents = Contragent.all.offset(1)
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



private

def acc_params
   params.require(:bank_account).permit(:bank_id, :contragent_id, :bank_account, :acc_reg_no)
end

end
