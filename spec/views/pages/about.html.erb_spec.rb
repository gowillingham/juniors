require 'spec_helper'

describe "pages/about" do
  it "should have correct header" do
  	render
  	rendered.should have_selector('h1', :content => "About #{APP_SHORT_NAME}")
  end
end
