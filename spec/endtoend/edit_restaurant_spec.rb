require 'spec_helper'

describe "edit restaurant scenario" do
  subject { page }
  
  it "should edit restaurant" do
    user = User.create(username: "test", password: "password")
    restaurant1 = Restaurant.create(name: "restaurant", location: "location")
    restaurant2 = Restaurant.create(name: "restaurant2", location: "location2")

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"

    first(".edit").click
    
    fill_in "Name", with: "new restaurant"
    fill_in "Location", with: "new location"
    click_button "Edit"

    updated_restaurant = Restaurant.find_by_id(restaurant1.id)
    
    updated_restaurant.name.should == "new restaurant"
    updated_restaurant.location.should == "new location"

    should have_selector("td", text: /^new restaurant$/)
    should have_selector("td", text: /^new location$/)
  end
end
