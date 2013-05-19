require 'spec_helper'

describe AdminsController do
  it "should login" do
  
    get :login
    session[:user_id].should == 1
  end
end
