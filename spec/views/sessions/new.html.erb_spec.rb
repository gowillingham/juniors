require 'spec_helper'

describe "sessions/new" do
	it "displays form to sign in " do
	  render
	  rendered.should have_selector('form', :action => sessions_path, :method => 'post')
	  rendered.should have_selector('input', :value => 'Sign in')
	end
end
