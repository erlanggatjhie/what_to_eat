require 'spec_helper'
require 'endtoend/pages/login_page'

describe "Logout" do
  subject { page }
  
  it "should log out successfully" do 
    User.create(username: "username", password: "password")

    login_page = LoginPage.new(page)
    login_page.go_to_page
    
    show_all_page = login_page.login "username", "password"
    show_all_page.logout
  end
end
