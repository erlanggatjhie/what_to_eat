require 'endtoend/pages/spec_page'
require 'endtoend/pages/show_all_page'

class EditPage < SpecPage
  def enter_new_name(restaurant)
    fill_in "Name", with: restaurant
  end

  def enter_new_location(location)
    fill_in "Location", with: location
  end

  def click_edit_button
    click_button "Edit"
    should_be_at show_all_path

    ShowAllPage.new(@page)
  end
end
