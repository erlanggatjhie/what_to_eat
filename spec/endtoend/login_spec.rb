require 'spec_helper'

describe "Login Page" do
  subject { page }
  it "Should login successfully" do
      user = User.create(username: "test", password: "password")

      visit login_path
      fill_in "Username", with: user.username
      fill_in "Password", with: "password"
      click_button "Login"

      uri = URI.parse(current_url)
      uri.path.should == show_all_path
  end
end
