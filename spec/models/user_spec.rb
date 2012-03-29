require 'spec_helper'

describe User do
	before(:each) do
		@attr = {
			:name => 'Firstname Lastname',
			:email => 'email@example.com',
			:password => 'password',
			:password_confirmation => 'password'
		}
	end

	context "validation" do
		it "should require a password" do
			User.new(@attr.merge(:password => nil)).should_not be_valid
		end

		it "should require password and password_confirmation to match" do
			User.new(@attr.merge(:password => 'different_password')).should_not be_valid
		end

		it "should require an email address" do
			User.new(@attr.merge(:email => nil)).should_not be_valid
		end

		it "should reject an invalid email address" do
			User.new(@attr.merge(:email => 'invalid')).should_not be_valid
		end

		it "should require a unique email address" do
			User.create(@attr)
			User.new(@attr).should_not be_valid
		end
	end

	it "should add a user given valid attributes" do
		lambda do
			User.create!(@attr)
		end.should change(User, :count).by(1)
	end
end
