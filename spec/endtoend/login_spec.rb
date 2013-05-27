require 'spec_helper'

describe "Login Page" do
  subject { page }
  it "Should login successfully" do
      user = User.create(username: "test", password: "password")

      visit login_path
      fill_in "Username", with: user.username
      fill_in "Password", with: "password"
      click_button "Login"

      current_url.should == "http://www.example.com/admin/authenticate?method=post"
  end
end
