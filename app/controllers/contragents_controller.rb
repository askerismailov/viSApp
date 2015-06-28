class ContragentsController < ApplicationController

def index
  @contragents = Contragent.paginate(:page => params[:page], :per_page => 8).order("id ASC")
  @types = ContType.all
end

def show
  @contragent = Contragent.find(params[:id])
  @bank_accounts = BankAccount.where(:contragent_id => @contragent.id)
end

def new
  @contragent = Contragent.new
  @types = ContType.all
end

def create
  @contragent = Contragent.new(cont_params)
  @types = ContType.all
  if @contragent.save
    flash.now[:notice] = "Contragent created successfully!"
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
    flash.now[:notice] = "Contragent updated successfully!"
    redirect_to(:action => 'index')
  else
    @types = ContType.all
    render('edit')
  end
end

def delete
  @contragent = Contragent.find(params[:id])
end

def destroy
  @contragent = Contragent.find(params[:id])
  @contragent.destroy
  flash[:notice] = "Contragent destroyed successfully!"
  redirect_to(:action => 'index')
end

private

def cont_params
  params.require(:contragent).permit(:cont_name, :cont_type_id)
end

end
