require 'endtoend/pages/spec_page'
require 'endtoend/pages/decide_page'

class IndexPage < SpecPage
  def go_to_page
    visit index_path
    should_be_at index_path
  end

  def click_decide_button
    click_button "decide"
    should_be_at decide_restaurant_path

    DecidePage.new(@page)
  end 
end
