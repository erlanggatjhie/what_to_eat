class AdminsController < ApplicationController
  def authenticate
    begin
      session[:user_id] = User.authenticate(params[:username], params[:password])
      redirect_to show_all_path
    rescue
      redirect_to login_path
    end
  end

  def login

  end

  def logout
    session[:user_id] = nil
    redirect_to login_path
  end
end
