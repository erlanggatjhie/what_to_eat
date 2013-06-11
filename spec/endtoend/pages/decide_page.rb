require 'endtoend/pages/spec_page'

class DecidePage < SpecPage
  def should_contains_restaurant(name, location)
    @page.should have_selector("td", text: name)
    @page.should have_selector("td", text: location)
  end
end
