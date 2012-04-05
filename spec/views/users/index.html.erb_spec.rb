require 'spec_helper'

describe 'users/index' do
	before(:each) do
		@user1 = Factory(:user)
		@user2 = Factory(:user)
		@user3 = Factory(:user)
		assign(:users, [@user1, @user2, @user3])
	end

	it 'renders attributes in table' do
		render
		assert_select 'tbody tr' do |rows|
			rows.each do |row|
				assert_select row, 'a', 3
				assert_select row, 'a', { :count => 1, :text => 'Edit' }
				assert_select row, 'a', { :count => 1, :text => 'Destroy' }
				assert_select row, 'a', { :count => 1, :text => @user1.name }
			end
		end
		rendered.should have_selector('table tr td', :content => @user1.email)
		rendered.should have_selector('table tr td', :content => @user2.email)
		rendered.should have_selector('table tr td', :content => @user3.email)
	end
end