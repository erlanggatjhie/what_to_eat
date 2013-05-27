require 'spec_helper'

describe "Login Page" do
  subject { page }
  it "Should login successfully" do
      visit login_path
  end
end
