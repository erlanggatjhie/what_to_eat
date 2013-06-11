require 'endtoend/pages/spec_page'
require 'endtoend/pages/insert_page'
require 'endtoend/pages/login_page'
require 'endtoend/pages/edit_page'

class ShowAllPage < SpecPage
  def should_display_restaurant(name, location)
    @page.should have_selector("td", text: /^#{name}$/)
    @page.should have_selector("td", text: /^#{location}$/)
  end

  def should_not_display_restaurant(name, location)
    @page.should_not have_selector("td", text: /^#{name}$/)
    @page.should_not have_selector("td", text: /^#{location}$/)
  end

  def logout
    click_on "Logout"
    should_be_at login_path

    LoginPage.new(@page)
  end

  def go_to_insert_page
    click_on "Create new restaurant"
    should_be_at insert_path

    InsertPage.new(@page)
  end

  def edit_first_restaurant
    first(".edit").click
    should_be_at edit_path(1)

    EditPage.new(@page)
  end

  def delete_first_restaurant
    first(".delete").click
    should_be_at show_all_path
  end
end
