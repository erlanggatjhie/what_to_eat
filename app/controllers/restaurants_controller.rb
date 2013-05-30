class RestaurantsController < ApplicationController
  before_filter :require_login

  def show_all
    @restaurants = Restaurant.all
  end

  def edit
    @restaurant = Restaurant.find_by_id(params[:id])
  end

  
  def require_login
    if !session[:user_id]
      redirect_to login_path
    end
  end
end
