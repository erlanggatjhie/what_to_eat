class AdminsController < ApplicationController
  def login
    begin
      User.authenticate(params[:username], params[:password])
    rescue UserException

    end
    render :action => 'show_all'
  end
end
