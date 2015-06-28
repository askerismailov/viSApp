class ContTypesController < ApplicationController

  def new
    @cont_type = ContType.new
  end

  def create
    @cont_type = ContType.new(cont_type_params)
  if @cont_type.save
    redirect_to(:controller => 'dashboard', :action => 'index')
  else
    render('new')
  end
  end


  private

  def cont_type_params
     params.require(:cont_type).permit(:cont_type)
  end



end
