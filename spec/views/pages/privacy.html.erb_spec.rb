require 'spec_helper'

describe "pages/privacy" do
  it "should be success" do
  	render
  	rendered.should have_selector("h1", :content => 'Privacy')
  end
end
