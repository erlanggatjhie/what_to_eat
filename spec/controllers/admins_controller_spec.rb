require 'spec_helper'

describe AdminsController do
  context "Authenticate Successfully" do
    before(:each) do 
      username  = "username"
      password = "password"
      User.stub(:authenticate).with(username, password).and_return(1)  
      post :login, { username: username, password: password }
    end

    it "should set session with user id" do
      session[:user_id].should == 1
    end

    it "should display show_all view" do
      response.should render_template(:shosw_all)
    end
  end
end
