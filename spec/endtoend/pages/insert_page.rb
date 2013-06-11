require 'endtoend/pages/spec_page'
require 'endtoend/pages/show_all_page'

class InsertPage < SpecPage
  def insert_restaurant(name, location)
    @page.fill_in "Name", with: name
    @page.fill_in "Location", with: location
    click_button "Insert"

    should_be_at show_all_path

    ShowAllPage.new(@page)
  end
end
