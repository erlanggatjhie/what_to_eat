require 'spec_helper'

describe RestaurantsController do
  context "show_all" do
    context "when not login" do
      it "should redirect to login page" do
        get :show_all
        response.should redirect_to login_path  
      end
    end

    context "when login" do
      before(:each) do
       session[:user_id] = 1
       get :show_all
      end

      it "should render show all page" do
        response.should render_template(:show_all)
      end

      it "should assign restaurants variable" do
        assigns(:restaurants).should_not be_nil
      end
    end
  end

  context "edit" do
    context "when not login" do
      it "should redirect to login page" do
        get :edit, id: 1
      end
    end

    context "when login" do
      before(:each) do
        @restaurant = Restaurant.create(name: "restaurant", location: "location")
        session[:user_id] = 1
        get :edit, id: @restaurant.id
      end

      it "should render edit template" do
        response.should render_template(:edit)
      end

      it "should assign restaurant variable" do
        assigns(:restaurant).should_not be_nil
      end

      it "should assign the right restaurant" do
        assigns(:restaurant).name.should == @restaurant.name
        assigns(:restaurant).location.should == @restaurant.location
      end
    end
  end

  context "perform_edit" do
    context "when not login" do
      it "should redirect to login page" do
        put :perform_edit, id: 1
        response.should redirect_to login_path
      end
    end

    context "when login" do
      before(:each) do
        @restaurant = Restaurant.create(name: "Name", location: "Location")
        @restaurant.name = "updated name"
        @restaurant.location = "updated location"
        session[:user_id] = 1
        put :perform_edit, id: @restaurant, restaurant: {name: "updated name", location: "updated location"}
      end

      it "should update attributes" do
        restaurant = Restaurant.find(@restaurant.id)
        restaurant.name.should == "updated name"
        restaurant.location.should == "updated location"
      end

      it "should redirect to show all page" do
        response.should redirect_to show_all_path
      end
    end
  end

  context "insert" do
    context "when not login" do
      it "should redirect to login page" do
        get :insert
        response.should redirect_to login_path
      end
    end

    context "when login" do
      before(:each) do
        session[:user_id] = 1
        get :insert
      end

      it "should render insert page" do
        response.should render_template(:insert)
      end

      it "should assign restaurant variable" do
        assigns(:restaurant).should_not be_nil
      end
    end
  end

  context "new" do
    context "when not login" do
      it "should redirect to login page" do
        post :new, id: nil
        response.should redirect_to login_path
      end
    end

    context "when login" do
      before(:each) do
        session[:user_id] = 1
        @restaurant = Restaurant.new(name: "Name", location: "Location")
        post :new, restaurant: {name: "Name", location: "Location" }
      end

      it "should change restaurant count into 1" do
        Restaurant.count == 1
      end

      it "should save restaurant" do
        restaurant = Restaurant.find(1)
        restaurant.name.should == @restaurant.name
        restaurant.location.should == @restaurant.location
      end

      it "should redirect to show all path" do
        response.should redirect_to show_all_path
      end
    end
  end

  context "destroy" do
    context "when not login" do
      it "should redirect to login page" do
        delete :destroy, id: 1
        response.should redirect_to login_path
      end
    end

    context "when login" do
      before(:each) do
        session[:user_id] = 1
        @restaurant = Restaurant.create(name: "Name", location: "Location")
        delete :destroy, id: @restaurant.id
      end

      it "should contains no data in restaurant table" do
        Restaurant.count.should == 0
      end

      it "should redirect to show_all path" do
        response.should redirect_to show_all_path
      end
    end
  end
end
