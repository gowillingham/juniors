require 'spec_helper'

describe "registrations/show" do
  before(:each) do
    @registration = assign(:registration, stub_model(Registration,
      :first_name => "",
      :last_name => "",
      :parent_first_name => "",
      :parent_last_name => "",
      :email => "",
      :phone => "",
      :address => "",
      :city => "",
      :state => "",
      :zip => "",
      :tshirt_size => "",
      :parent_tshirt_size => "",
      :school => "",
      :grade => "",
      :note => "",
      :waiver => "",
      :parent_helper => "",
      :volleyball => "",
      :product_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/1/)
  end
end
