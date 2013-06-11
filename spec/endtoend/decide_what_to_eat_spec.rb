require 'spec_helper'
require 'endtoend/pages/index_page'

describe "decide what to eat" do
  subject { page }
  it "should show random restaurant" do
    Restaurant.create(name: "Test Rest 1", location: "Test Location 1")
    Restaurant.create(name: "Test Rest 2", location: "Test Location 2")

    index_page = IndexPage.new(page)
    index_page.go_to_page
    decide_page = index_page.click_decide_button

    decide_page.should_contains_restaurant "Test Rest", "Test Location"
  end
end
