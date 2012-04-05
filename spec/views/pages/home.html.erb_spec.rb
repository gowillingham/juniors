require 'spec_helper'

describe "pages/home.html.erb" do
  it "should be success" do
  	render
  	rendered.should have_selector("h1", :content => "What's new at #{APP_SHORT_NAME}")
  end
end
