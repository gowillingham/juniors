require 'spec_helper'

describe "registrations/index" do
  before(:each) do
    @product = Factory(:product)
    @registration_1 = Factory(:registration, :product => @product)
    @registration_1.payments << Factory(:payment, :registration_id => @registration_1.id)
    @registration_2 = Factory(:registration, :product => @product)
    @registration_2.payments << Factory(:payment, :registration_id => @registration_2.id)
    assign(:registrations, [@registration_1, @registration_2])
  end

  it "renders a list of registrations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "#{@registration_1.last_name}, #{@registration_1.first_name}".to_s
    assert_select "tr>td", :text => @registration_1.email.to_s
    assert_select "tr>td", :text => @registration_2.email.to_s
    assert_select "tr>td", :text => @registration_1.grade.to_s
    assert_select "tr>td", :text => @registration_2.grade.to_s
    assert_select "tr>td", :text => @registration_1.school.to_s
    assert_select "tr>td", :text => @registration_2.school.to_s
    assert_select "tr>td", :text => @product.code.to_s, :count => 2
  end
end
