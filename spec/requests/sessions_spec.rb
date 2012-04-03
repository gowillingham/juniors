require 'spec_helper'

describe 'Sessions' do 
	describe 'sign in' do
		before(:each) do
			@user = User.create!(
				:name => 'First Last', 
				:email => 'email@example.com',
				:password => 'password',
				:password_confirmation => 'password',
			)
		end 

		describe 'failure' do
			it "should not log in the user" do
				visit signin_path
				fill_in 'Email', 			:with => ''
				fill_in 'Password', 	:with => ''
				click_button 
				controller.should_not be_logged_in
				controller.current_user.should_not eq(@user)
				response.should render_template('sessions/new')
				response.should have_selector('p.alert-error', :content => 'did not match')
			end	
		end

		describe 'success' do
			it "should log in the user" do
				visit signin_path
				fill_in 'Email', 			:with => @user.email
				fill_in 'Password', 	:with => 'password'
				click_button 
				controller.should be_logged_in
				controller.current_user.should eq(@user)
				response.should have_selector('p.alert-success', :content => 'Logged in!')
				response.should render_template('pages/home')
			end	
		end
	end
end