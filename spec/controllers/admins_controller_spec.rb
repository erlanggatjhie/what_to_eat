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
      response.should redirect_to(action: :show_all)
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
      response.should redirect_to(action: :login)
    end
  end

  context "Display login page" do
    it "should display login page" do
      get :login
      response.should render_template(:login)
    end
  end

  context "Show All Restaurants" do
    it "should redirected to login page when not login" do
      get :show_all
      response.should redirect_to(action: :login)
    end

    it "should show all restaurants page" do
      session[:user_id] = 1
      get :show_all
      response.should render_template(:show_all)
    end

    it "should pass all restaurants" do
      Restaurant.stub(:all).and_return([])
      session[:user_id] = 1
      get :show_all

      assigns(:restaurants).should_not be_nil
    end
  end

  context "Logout" do
    it "should logout" do
      session[:user_id] = 1
      expect { delete :logout }.to change { session[:user_id] }.to(nil)     
    end
  end
end
