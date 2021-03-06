require 'spec_helper'

describe "products/edit" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :name => "MyString",
      :description => "MyString",
      :category => "MyString",
      :code => "MyCode",
      :enabled => false,
      :price => "MyString"
    ))
  end

  it "renders the edit product form" do
    controller.stub!(:action_name).and_return("Edit")
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => products_path(@product), :method => "post" do
      assert_select "input#product_name", :name => "product[name]"
      assert_select "textarea#product_description", :name => "product[description]"
      assert_select "input#product_category", :name => "product[category]"
      assert_select "input#product_code", :name => "product[code]"
      assert_select "input#product_enabled", :name => "product[enabled]"
      assert_select "input#product_price", :name => "product[price]"
    end
  end
end
