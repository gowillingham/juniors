require 'spec_helper'

describe "registrations/index" do
  before(:each) do
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
        :product_id => 1
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
        :product_id => 1
      )
    ])
  end

  it "renders a list of registrations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
