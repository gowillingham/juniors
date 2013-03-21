require 'spec_helper'

describe "pages/calendar" do
	it "should display google calendar" do
		render
		rendered.should have_selector('iframe')
	end
end