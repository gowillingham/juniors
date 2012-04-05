require 'spec_helper'

describe "Products" do
	before(:each) do
		@user = Factory(:user)
		visit signin_path
		fill_in "Email", 			:with => @user.email
		fill_in "Password", 	:with => 'password'
		click_button
	end

  describe "GET /products" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get products_path
      response.status.should be(200)
    end

    it "should display a product listing"
  end

  describe "GET /update" do
  	it "should update the product"
  end

  describe "GET /new" do
  	it "should create a new product"
  end

  describe "DELETE /destroy" do
  	it "should destroy the product"
  end	
end
