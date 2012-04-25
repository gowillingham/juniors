require 'spec_helper'

describe Product do
	before(:each) do
		@attr = {
			:name => 'name',
			:description => 'description', 
			:enabled => true,
			:category => 'category'
		}
	end

	context "methods" do
		it "should include .registrations" do
			product = Product.create(@attr)
			product.should respond_to(:registrations)
		end
	end

	context "validations" do
		it "should require a name" do
			Product.new(:name => nil).should_not be_valid
		end
	end
end
