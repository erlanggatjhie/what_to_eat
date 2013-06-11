require 'spec_helper'

class SpecPage
  include Rails.application.routes.url_helpers
  include Capybara::RSpecMatchers
  include Capybara::DSL

  def initialize(page)
    @page = page
  end

  def should_be_at(path)
    get_current_path.should == path
  end

  def get_current_path
    URI.parse(@page.current_url).path
  end
end
