require 'endtoend/pages/spec_page'
require 'endtoend/pages/show_all_page'

class LoginPage < SpecPage
  def go_to_page
    @page.visit login_path
    should_be_at login_path
  end

  def login(username, password)
    @page.fill_in "Username", with: username
    @page.fill_in "Password", with: password
    @page.click_button "Login"
    should_be_at show_all_path

    ShowAllPage.new(@page)
  end
end
