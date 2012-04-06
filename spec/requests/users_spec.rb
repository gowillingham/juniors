require 'spec_helper'

describe "Users" do
	before(:each) do
		@user = Factory(:user)
		visit signin_path
		fill_in "Email", 			:with => @user.email
		fill_in "Password", 	:with => 'password'
		click_button
	end

	describe "create" do
		describe "success" do
			it "should make a new user" do
				lambda do
					visit new_user_path
					fill_in "Name", 									:with => 'New user'
					fill_in "Email", 									:with => 'new@example.com'
					fill_in "Password", 							:with => 'password'
					fill_in "Confirm password", 	:with => 'password'
					click_button
					response.should render_template('users/show')
					response.should have_selector('p.alert-success', :content => 'successfully created')
				end.should change(User, :count).by(1)

			end
		end

		describe "failure" do
			it "should not make a new user" do
				lambda do
					visit new_user_path
					fill_in "Name", 									:with => ''
					fill_in "Email", 									:with => ''
					fill_in "Password", 							:with => ''
					fill_in "Confirm password", 	:with => 'password'
					click_button
					response.should render_template('users/new')
					response.should have_selector('div.alert-error', :content => "Name can't be blank")
					response.should have_selector('div.alert-error', :content => "Email can't be blank")
					response.should have_selector('div.alert-error', :content => "Password can't be blank")
				end.should change(User, :count).by(0)
			end
		end
	end

	describe "update" do
		describe "success" do
  		it "should update the user attributes" do
  			user = Factory(:user)
  			visit edit_user_path(user)
  			fill_in "Name", 					:with => 'New name'
  			fill_in "Email", 					:with => 'different@example.com'
  			click_button
  			response.should have_selector('p.alert-success', :content => 'successfully updated')
  			user.reload.email.should eq('different@example.com')
  			user.reload.name.should eq('New name')
  			response.should render_template('users/show')
  		end
		end

		describe "failure" do
			it "should not update the user attributes" do
				user = Factory(:user)
				visit edit_user_path(user)
  			fill_in "Name", 					:with => ''
  			fill_in "Email", 					:with => ''
  			click_button
  			response.should have_selector('div.alert-error', :content => "Name can't be blank")
  			response.should have_selector('div.alert-error', :content => "Email can't be blank")
  			user.reload.name.should_not eq('')
  			user.reload.email.should_not eq('')
  			response.should render_template('users/edit')
			end
		end 
	end
end
