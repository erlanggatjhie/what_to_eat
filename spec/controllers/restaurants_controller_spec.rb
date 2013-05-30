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

  context "edit" do
    it "should redirect to login page when not login" do
      get :edit, id: 1
      response.should redirect_to login_path
    end

    context "should display edit Restaurant page" do
      before(:each) do
        session[:user_id] = 1
        @restaurant = mock_model(Restaurant)
        Restaurant.stub(:find_by_id).with("1").and_return(@restaurant)
        
        get :edit, id: 1
      end
      
      it "should render edit  page" do
        response.should render_template(:edit)
      end

      it "should pass restaurant" do
        assigns(:restaurant).should_not be_nil
      end
    end
  end
end
