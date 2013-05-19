class AdminsController < ApplicationController
  def login
    render :action => 'show_all'
  end
end
