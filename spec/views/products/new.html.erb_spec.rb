require 'spec_helper'

describe "products/new" do
  before(:each) do
    assign(:product, stub_model(Product,
      :name => "MyString",
      :description => "MyString",
      :category => "MyString",
      :enabled => false,
      :price => "MyString"
    ).as_new_record)
  end

  it "renders new product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => products_path, :method => "post" do
      assert_select "input#product_name", :name => "product[name]"
      assert_select "input#product_description", :name => "product[description]"
      assert_select "input#product_category", :name => "product[category]"
      assert_select "input#product_enabled", :name => "product[enabled]"
      assert_select "input#product_price", :name => "product[price]"
    end
  end
end
