class AdminsController < ApplicationController
  def authenticate
    begin
      session[:user_id] = User.authenticate(params[:username], params[:password])
      render :action => 'show_all'
    rescue UserException
      render :action => 'login'
    end
  end
end
