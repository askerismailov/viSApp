class BankAccountsController < ApplicationController


def index
  @bank_accounts = BankAccount.paginate(:page => params[:page], :per_page => 8).order("id ASC")
  @indices = PostIndex.all
  @cities = City.all
end

def new
  @bank_account = BankAccount.new
  @contragent = Contragent.find(params[:id])
  @banks = Bank.all
end

def create
  @bank_account = BankAccount.new(acc_params)
  @contragent = Contragent.find(params[:id])
if @bank_account.save
  redirect_to(:controller => 'contragents', :action => 'show', :id => @contragent.id)
else
  render('new')
end
end

def edit
  @bank_account = BankAccount.find(params[:id])
  @banks = Bank.all
end

def update
  @bank_account = BankAccount.find(params[:id])
  @contragent = Contragent.find(@bank_account.contragent.id)
  if @bank_account.update_attributes(acc_params)
    redirect_to(:controller => 'contragents', :action => 'show', :id => @bank_account.contragent.id)
  else
    render('edit')
  end
end

def delete
  @bank_account = BankAccount.find(params[:id])
  @contragent = Contragent.find(@bank_account.contragent.id)
end

def destroy
  @bank_account = BankAccount.find(params[:id])
  @contragent = Contragent.find(@bank_account.contragent.id)
  @bank_account.destroy
  flash[:notice] = "Bank account destroyed successfully!"
  redirect_to(:controller => 'contragents', :action => 'show', :id => @bank_account.contragent.id)
end

private

def acc_params
   params.require(:bank_account).permit(:bank_id, :contragent_id, :bank_account)
end

end
