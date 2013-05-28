class AdminsController < ApplicationController
  def authenticate
    begin
      session[:user_id] = User.authenticate(params[:username], params[:password])
      redirect_to action: :show_all
    rescue
      redirect_to action: :login
    end
  end

  def login

  end

  def show_all
    if session[:user_id]
      @restaurants = Restaurant.all
      render :action => "show_all"
    else
      redirect_to action: :login
    end
  end
end
