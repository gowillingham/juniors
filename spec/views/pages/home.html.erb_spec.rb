require 'spec_helper'

describe "pages/home" do
  it "should be success" do
  	render
  	rendered.should have_selector("h1", :content => "#{APP_SHORT_NAME}")
  end
end
