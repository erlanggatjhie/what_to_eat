require 'spec_helper'

describe AdminsController do
  context "Authenticate Successfully" do
    before(:each) do 
      username  = "username"
      password = "password"
      User.stub(:authenticate).with(username, password).and_return(1)  
      post :authenticate, { username: username, password: password }
    end

    it "should set session with user id" do
      session[:user_id].should == 1
    end

    it "should display show_all view" do
      response.should render_template(:show_all)
    end
  end

  context "Authentication Failed" do
    before(:each) do 
      username  = "username"
      password = "password"
      User.stub(:authenticate).with(username, password).and_raise(UserException.new("Authentication Failed")) 
      post :authenticate, { username: username, password: password }
    end

    it "should set session with user id" do
      session[:user_id].should be_nil
    end

    it "should display show_all view" do
      response.should render_template(:login)
    end
  end

  context "Display login page" do
    it "should display login page" do
      get :login
      response.should render_template(:login)
    end
  end
end
