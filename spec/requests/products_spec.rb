require 'spec_helper'

describe "Products" do
	before(:each) do
		@user = Factory(:user)
		visit signin_path
		fill_in "Email", 			:with => @user.email
		fill_in "Password", 	:with => 'password'
		click_button
	end

  describe "GET /new" do
    describe "success" do
      it "should create a product" do
        lambda do
          visit 'products/new'
          fill_in "Name",         :with => 'New product'
          fill_in "Description",  :with => 'Volleyball'
          fill_in "Category",     :with => 'Category'
          fill_in "Price",        :with => 3500
          check "Enabled?"
          click_button

          response.should render_template('products/show')
          response.should have_selector('p.alert-success', :content => 'successfully created')
        end.should change(Product, :count).by(1)
      end
    end
    
    describe "failure" do
      it "should not create a product" do
        lambda do
          visit 'products/new'
          fill_in "Name",         :with => nil
          fill_in "Description",  :with => 'Volleyball'
          fill_in "Category",     :with => 'Category'
          fill_in "Price",        :with => 3500
          check "Enabled?"
          click_button

          response.should render_template('products/new')
          response.should have_selector('div.alert-error', :content => "Name can't be blank")
        end.should change(Product, :count).by(0)
      end
    end
  end

  describe "GET /update" do
    before(:each) do
      @product = Product.create!(
        :name => 'Product name',
        :description => 'Product description',
        :category => 'Product category',
        :price => 3500,
        :enabled => true
      )
    end

    describe "success" do
      it "should update the product attributes" do
        visit edit_product_path(@product)
        fill_in "Name",         :with => 'New name'
        fill_in "Description",  :with => 'New description'
        fill_in "Category",     :with => 'New category'
        fill_in "Price",        :with => 4000
        uncheck "Enabled"
        click_button

        response.should render_template('products/show')
        response.should have_selector('p.alert-success', :content => 'successfully updated')
        @product.reload.name.should eq('New name')
        @product.reload.description.should eq('New description')
        @product.reload.category.should eq('New category')
        @product.reload.price.should eq(4000)
        @product.reload.enabled.should_not be_true
      end
    end

    describe "failure" do
      it "should not update the product attributes" do
        visit edit_product_path(@product)
        fill_in "Name",         :with => nil
        fill_in "Description",  :with => 'New description'
        fill_in "Category",     :with => 'New category'
        fill_in "Price",        :with => 4000
        uncheck "Enabled"
        click_button

        response.should render_template('products/edit')
        response.should have_selector('div.alert-error', :content => "Name can't be blank")
        @product.reload.name.should eq(@product.name)
        @product.reload.description.should eq(@product.description)
        @product.reload.category.should eq(@product.category)
        @product.reload.price.should eq(@product.price)
        @product.reload.enabled.should be_true
      end
    end
  end
end