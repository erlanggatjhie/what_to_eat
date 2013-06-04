require 'spec_helper'

describe "delete restaurant" do
  subject { page }

  it "should delete restaurant" do
    user = User.create(username: "test", password: "password")

    restaurant = Restaurant.create(name: "Restaurant", location: "Location")

    visit login_path
    fill_in "Username", with: "test"
    fill_in "Password", with: "password"
    click_button "Login"

    first(".delete").click

    should_not have_selector("td", /^Restaurant$/)
    should_not have_selector("td", /^Location$/)
  end
end


