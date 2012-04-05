require 'spec_helper'

describe Product do
	context "validations" do
		it "should require a name" do
			Product.new(:name => nil).should_not be_valid
		end
	end
end
