require 'spec_helper'

describe ApplicationHelper do
  describe "dollarify" do
  	it "converts cents to formatted currency" do
  		helper.dollarify(7000).should eq("$70.00")
  		helper.dollarify(0).should eq("$0.00")
  		helper.dollarify(10).should eq("$0.10")
  		helper.dollarify(-7000).should eq ("-$70.00")
  	end
  end
end
