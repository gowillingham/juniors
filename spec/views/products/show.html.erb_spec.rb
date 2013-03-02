require 'spec_helper'

describe "products/show" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :name => "Name",
      :description => "Description",
      :category => "Category",
      :code => "Code",
      :enabled => false,
      :price => "Price"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Description/)
    rendered.should match(/Category/)
    rendered.should match(/Code/)
    rendered.should match(/false/)
    rendered.should match(/Price/)
  end
end
