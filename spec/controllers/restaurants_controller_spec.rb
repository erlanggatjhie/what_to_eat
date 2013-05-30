require 'spec_helper'

describe RestaurantsController do
  context "show_all" do
    it "should redirected to login page when not login" do
      get :show_all
      response.should redirect_to login_path
    end  

    it "should show all restaurants page" do
      session[:user_id] = 1
      get :show_all
      response.should render_template(:show_all)
    end

    it "should pas all restaurants" do
      Restaurant.stub(:all).and_return([])
      session[:user_id] = 1
      get :show_all

      assigns(:restaurants).should_not be_nil
    end
  end
end
