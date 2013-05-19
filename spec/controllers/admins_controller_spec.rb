require 'spec_helper'

describe AdminsController do
  it "should login" do
    username  = "username"
    password = "password"
    User.stub(:authenticate).with(username, password).and_return(1)  
    post :login, { username: username, password: password }
    session[:user_id].should == 1
  end
end
