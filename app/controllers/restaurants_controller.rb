class RestaurantsController < ApplicationController
  before_filter :require_login, except: [:index, :show_random_restaurant]

  def show_all
    @restaurants = Restaurant.all
  end

  def edit
    @restaurant = Restaurant.find_by_id(params[:id])
  end

  def perform_edit
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

  def insert
    @restaurant = Restaurant.new    
  end

  def new
    restaurant = Restaurant.new(params[:restaurant])
    if restaurant.save
      redirect_to show_all_path
    else
      redirect_to insert_path
    end
  end

  def destroy
    restaurant = Restaurant.find(params[:id])
    restaurant.destroy
    redirect_to show_all_path 
  end

  def index
  end

  def show_random_restaurant
    total_restaurant_count = Restaurant.count

    if total_restaurant_count > 0
      @restaurant = Restaurant.offset(Random.rand(total_restaurant_count)).first
    end
  end 
end
