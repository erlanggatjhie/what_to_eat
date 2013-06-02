class RestaurantsController < ApplicationController
  before_filter :require_login

  def show_all
    @restaurants = Restaurant.all
  end

  def edit
    @restaurant = Restaurant.find_by_id(params[:id])
  end

  def perform_edit
    puts params
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update_attributes(params[:restaurant])
      redirect_to show_all_path
    else
      redirect_to edit_path(@restaurant)
    end
  end

  def require_login
    if !session[:user_id]
      redirect_to login_path
    end
  end
end
