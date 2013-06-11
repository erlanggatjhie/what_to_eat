require 'spec_helper'
require 'endtoend/pages/login_page'

describe "insert restaurant scenario" do
  subject { page }

  it "should insert successfully" do
    User.create(username: "username", password: "password")
  
    login_page = LoginPage.new(page)
    login_page.go_to_page
    
    show_all_page = login_page.login "username", "password"
    insert_page = show_all_page.go_to_insert_page

    show_all_Page = insert_page.insert_restaurant "New Restaurant", "Location"
    show_all_page.should_display_restaurant "New Restaurant", "Location"
  end
end
