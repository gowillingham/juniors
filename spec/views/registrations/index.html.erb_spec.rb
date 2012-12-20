require 'spec_helper'

describe "registrations/index" do
  before(:each) do
    @product = Factory(:product)
    assign(:registrations, [
      stub_model(Registration,
        :first_name => 'first_name', 
        :last_name => 'last_name', 
        :parent_first_name => 'parent_first_name', 
        :parent_last_name => 'parent_last_name', 
        :email => 'email@example.com', 
        :address => 'address', 
        :phone => '999 999 9999', 
        :city => 'city', 
        :state => 'state', 
        :tshirt_size => 'YL', 
        :parent_tshirt_size => 'XL', 
        :grade => '5', 
        :school => 'school', 
        :note => 'note', 
        :waiver => true, 
        :parent_helper => true, 
        :volleyball => true, 
        :product_id => @product.id
      ),
      stub_model(Registration,
        :first_name => 'first_name', 
        :last_name => 'last_name', 
        :parent_first_name => 'parent_first_name', 
        :parent_last_name => 'parent_last_name', 
        :email => 'email@example.com', 
        :address => 'address', 
        :phone => '999 999 9999', 
        :city => 'city', 
        :state => 'state', 
        :tshirt_size => 'YL', 
        :parent_tshirt_size => 'XL', 
        :grade => '5', 
        :school => 'school', 
        :note => 'note', 
        :waiver => true, 
        :parent_helper => true, 
        :volleyball => true, 
        :product_id => @product.id
      )
    ])
  end

  it "renders a list of registrations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "last_name, first_name".to_s, :count => 2
    assert_select "tr>td", :text => "email@example.com".to_s, :count => 2
    assert_select "tr>td", :text => "5".to_s, :count => 2
    assert_select "tr>td", :text => "school".to_s, :count => 2
    assert_select "tr>td", :text => @product.id.to_s, :count => 2
  end
end
