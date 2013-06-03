require 'spec_helper'

describe "insert restaurant scenario" do
  subject { page }

  it "should insert successfully" do
    User.create(username: "username", password: "password")

    visit login_path
    fill_in "Username", with: "username"
    fill_in "Password", with: "password"
    click_button "Login"

    click_link "Create new restaurant"

    fill_in "Name", with: "New Restaurant"
    fill_in "Location", with: "Location"
    click_button "Insert"

    should have_selector("td", text: /^New Restaurant$/)
    should have_selector("td", text: /^Location$/)
  end
end
