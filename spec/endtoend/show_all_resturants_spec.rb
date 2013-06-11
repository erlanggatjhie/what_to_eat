require 'spec_helper'
require 'endtoend/pages/login_page'

describe "Show All Restaurants" do
  subject { page }
  
  it "should display all restaurants" do
    User.create(username: "username", password: "password")
    Restaurant.create(name: "Restaurant 1", location: "Earth")
    Restaurant.create(name: "Restaurant 2", location: "Mars")

    login_page = LoginPage.new(page)
    login_page.go_to_page
    show_all_page = login_page.login "username", "password"
    show_all_page.should_display_restaurant "Restaurant 1", "Earth"
    show_all_page.should_display_restaurant "Restaurant 2", "Mars"
  end
end
