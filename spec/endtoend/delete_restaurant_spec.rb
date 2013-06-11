require 'spec_helper'
require 'endtoend/pages/login_page'

describe "delete restaurant" do
  subject { page }

  it "should delete restaurant" do
    user = User.create(username: "test", password: "password")

    restaurant = Restaurant.create(name: "Restaurant", location: "Location")

    login_page = LoginPage.new(page)
    login_page.go_to_page
    show_all_page = login_page.login "test", "password"

    show_all_page.delete_first_restaurant
    show_all_page.should_not_display_restaurant("Restaurant", "Location")
  end
end


