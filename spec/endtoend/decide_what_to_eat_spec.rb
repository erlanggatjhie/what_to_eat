require 'spec_helper'

describe "decide what to eat" do
  subject { page }
  it "should show random restaurant" do
    Restaurant.create(name: "Test Rest 1", location: "Test Location 1")
    Restaurant.create(name: "Test Rest 2", location: "Test Location 2")

    visit root_path
    click_button "decide"

    should have_selector("td", "Test Rest")
    should have_selector("td", "Test Location")
  end
end
