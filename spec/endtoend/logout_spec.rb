require 'spec_helper'

describe "Logout" do
  subject { page }
  
  it "should log out successfully" do 
    User.create(username: "username", password: "password")

    visit login_path
    fill_in "Username", with: "username"
    fill_in "Password", with: "password"
    click_button "Login"

    click_on "Logout"

    uri = URI.parse(current_url)

    uri.path.should == login_path
  end
end
