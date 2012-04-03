require 'spec_helper'

describe "pages/contact" do
  it "should be success" do
  	render
  	rendered.should have_selector('h1', :content => 'Contact')
  end
end
