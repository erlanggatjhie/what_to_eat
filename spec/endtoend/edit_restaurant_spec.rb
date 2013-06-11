require 'spec_helper'
require 'endtoend/pages/login_page'

describe "edit restaurant scenario" do
  subject { page }
  
  it "should edit restaurant" do
    user = User.create(username: "test", password: "password")
    restaurant1 = Restaurant.create(name: "restaurant", location: "location")
    restaurant2 = Restaurant.create(name: "restaurant2", location: "location2")


    login_page = LoginPage.new(page)
    login_page.go_to_page
    show_all_page = login_page.login "test", "password"
   
    edit_page = show_all_page.edit_first_restaurant 
    
    edit_page.enter_new_name "new restaurant"
    edit_page.enter_new_location "new location"
  
    show_all_page = edit_page.click_edit_button
    show_all_page.should_display_restaurant "new restaurant", "new location"
  end
end
