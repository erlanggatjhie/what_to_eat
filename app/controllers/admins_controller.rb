class AdminsController < ApplicationController
  def login
    begin
       session[:user_id] = User.authenticate(params[:username], params[:password])
    rescue UserException

    end
    render :action => 'show_all'
  end
end
