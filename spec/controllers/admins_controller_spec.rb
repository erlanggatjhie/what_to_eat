require 'spec_helper'

describe AdminsController do
  context "Authenticate Successfully" do
    before(:each) do 
      username  = "username"
      password = "password"
      User.stub(:authenticate).with(username, password).and_return(1) 
      Restaurant.stub(:all).and_return([]) 
      post :authenticate, { username: username, password: password }
    end

    it "should set session with user id" do
      session[:user_id].should == 1
    end

    it "should display show_all view" do
      response.should redirect_to show_all_path
    end
  end

  context "Authentication Failed" do
    before(:each) do 
      username  = "username"
      password = "password"
      User.stub(:authenticate).with(username, password).and_raise(UserException.new("Authentication Failed")) 
      post :authenticate, { username: username, password: password }
    end

    it "should not set session with user id" do
      session[:user_id].should be_nil
    end

    it "should redirect to login page" do
      response.should redirect_to login_path
    end
  end

  context "Display login page" do
    it "should display login page" do
      get :login
      response.should render_template(:login)
    end
  end

  context "Logout" do
    it "should logout" do
      session[:user_id] = 1
      expect { delete :logout }.to change { session[:user_id] }.to(nil)     
    end
  end
end
