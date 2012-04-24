require 'spec_helper'

describe "registrations/edit" do
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

  it "renders the edit registration form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => registrations_path(@registration), :method => "post" do
      assert_select "input#registration_first_name", :name => "registration[first_name]"
      assert_select "input#registration_last_name", :name => "registration[last_name]"
      assert_select "input#registration_parent_first_name", :name => "registration[parent_first_name]"
      assert_select "input#registration_parent_last_name", :name => "registration[parent_last_name]"
      assert_select "input#registration_email", :name => "registration[email]"
      assert_select "input#registration_phone", :name => "registration[phone]"
      assert_select "input#registration_address", :name => "registration[address]"
      assert_select "input#registration_city", :name => "registration[city]"
      assert_select "input#registration_state", :name => "registration[state]"
      assert_select "input#registration_zip", :name => "registration[zip]"
      assert_select "input#registration_tshirt_size", :name => "registration[tshirt_size]"
      assert_select "input#registration_parent_tshirt_size", :name => "registration[parent_tshirt_size]"
      assert_select "input#registration_school", :name => "registration[school]"
      assert_select "input#registration_grade", :name => "registration[grade]"
      assert_select "input#registration_note", :name => "registration[note]"
      assert_select "input#registration_waiver", :name => "registration[waiver]"
      assert_select "input#registration_parent_helper", :name => "registration[parent_helper]"
      assert_select "input#registration_volleyball", :name => "registration[volleyball]"
      assert_select "input#registration_product_id", :name => "registration[product_id]"
    end
  end
end
