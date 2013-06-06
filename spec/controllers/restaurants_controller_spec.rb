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

    it "should pass all restaurants" do
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
        @restaurant = mock(Restaurant)
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

  context "perform edit" do
    it "should redirect to login page when not login" do
      put :perform_edit, id: 1
      response.should redirect_to login_path
    end

    context "should edit restaurant" do
      it "should redirect to show all page" do
        session[:user_id] = 1

        @restaurant = mock(Restaurant)
        @restaurant.stub(:update_attributes).and_return(true)
        Restaurant.stub(:find).and_return(@restaurant)

        put :perform_edit, {id: @restaurant, restaurant: @params}
        response.should redirect_to show_all_path
      end
    end

    context "should not edit restaurant when update not successful" do
      it "should redirect to edit page" do 
        session[:user_id] = 1

        @restaurant = mock(Restaurant)
        @restaurant.stub(:update_attributes).and_return(false)
        Restaurant.stub(:find).and_return(@restaurant)

        put :perform_edit, {id: @restaurant, restaurant: @params}
        response.should redirect_to edit_path(@restaurant)
      end
    end
  end

  context "insert" do
    it "should redirect to login page when not login" do
      get :insert
      response.should redirect_to login_path
    end

    it "should render insert new page" do
      session[:user_id] = 1
      get :insert
      response.should render_template(:insert)      
    end

    it "should pass object to the view" do
      session[:user_id] = 1
      get :insert
      assigns(:restaurant).should_not be_nil
    end
  end

  context "new" do
    it "should redirect to login page when not login" do
      post :new, id: mock(Restaurant)
      response.should redirect_to login_path
    end

    it "should insert new restaurant" do
      session[:user_id] = 1
      restaurant = mock(Restaurant)
      restaurant.stub(:save).and_return(true)
      Restaurant.stub(:new).and_return(restaurant)

      post :new, restaurant: restaurant
      response.should redirect_to show_all_path
    end

    it "should not insert restaurant when invalid" do
      session[:user_id] = 1
      restaurant = mock(Restaurant)
      restaurant.stub(:save).and_return(false)
      Restaurant.stub(:new).and_return(restaurant)

      post :new, restaurant: restaurant
      response.should redirect_to insert_path
    end
  end

  context "delete" do
    it "redirect to login page when not login" do
      delete :destroy, id: 1
      response.should redirect_to login_path
    end

    it "should delete restaurant" do
      session[:user_id] = 1
      restaurant = mock(Restaurant)
      Restaurant.stub(:find).and_return(restaurant)
      restaurant.should_receive(:destroy)

      delete :destroy, id: 1
      response.should redirect_to show_all_path
    end
  end

  context "index" do
      before(:each) do
        get :index
      end

      it "should render index page" do
        response.should render_template(:index)
      end
  end

  context "show_random_restaurant" do
    context "when valid" do
      before(:each) do
        restaurant = Restaurant.new(name: "restaurant", location: "location")
        Restaurant.stub(:count).and_return(1)
        Random.stub(:rand).with(1).and_return(1)
        Restaurant.stub(:offset).and_return(Restaurant)
        Restaurant.stub(:first).and_return(restaurant)
        post :show_random_restaurant
      end

      it "should render show restaurant" do
        response.should render_template(:show_random_restaurant)
      end

      it "should assign restaurant variable" do
        assigns(:restaurant).should_not be_nil
      end

      it "should assign valid restaurant variable" do
        restaurant = assigns(:restaurant)
        restaurant.name.should == "restaurant"
        restaurant.location.should == "location"
      end
    end

    context "when invalid" do
      before(:each) do
        Restaurant.stub(:count).and_return(0)
        post :show_random_restaurant
      end

      it "should render show restaurant" do
        response.should render_template(:show_random_restaurant)
      end

      it "should assign restaurant variable" do
        assigns(:restaurant).should be_nil
      end
    end
  end
end
