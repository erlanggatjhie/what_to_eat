require 'spec_helper'
require 'endtoend/pages/login_page'

describe "Login Page" do
  subject { page }
  it "Should login successfully" do
      user = User.create(username: "test", password: "password")

      login_page = LoginPage.new(page)
      login_page.go_to_page

      login_page.login "test", "password"
  end
end
