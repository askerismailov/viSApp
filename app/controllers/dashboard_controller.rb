class DashboardController < ApplicationController


  def index
    @cities = City.order("created_at DESC").limit(5)
    @cities_all = City.all.size - 1
  end

end
