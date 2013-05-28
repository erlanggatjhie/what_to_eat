require 'spec_helper'

describe "Show All Restaurants" do
  subject { page }
  
  it "should display all restaurants" do
    User.create(username: "username", password: "password")
    Restaurant.create(name: "Restaurant 1", location: "Earth")
    Restaurant.create(name: "Restaurant 2", location: "Mars")

    visit login_path
    fill_in "Username", with: "username"
    fill_in "Password", with: "password"
    click_button "Login"

    should have_selector("th", text: /^Name$/)
    should have_selector("th", text: /^Location$/)
    should have_selector("td", text: /^Restaurant 1$/)
    should have_selector("td", text: /^Restaurant 2$/)
    should have_selector("td", text: /^Earth$/)
    should have_selector("td", text: /^Mars$/)
  end
end
