require 'spec_helper'

describe AdminsController do 
  context "Authenticate" do
    context "when successful" do
      before(:each) do
        User.create(username: "username", password: "password")
        post :authenticate, {username: "username", password: "password"}
      end

      it "should redirect to show all path" do
        response.should redirect_to show_all_path
      end

      it "should set user session" do
        session[:user_id].should == 1
      end
    end
  end
end

