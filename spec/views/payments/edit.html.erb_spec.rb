require 'spec_helper'

describe "payments/edit" do
  before(:each) do
    @payment = assign(:payment, stub_model(Payment,
      :registrations_id => 1,
      :amount => 1,
      :online => false,
      :scholarship => false,
      :paypal_txn_id => "MyString",
      :paypal_txn_type => "MyString",
      :paypal_mc_fee => "MyString",
      :paypal_sandbox => "MyString",
      :paypal_payment_status => "MyString",
      :paypal_pending_status_reason => "MyString",
      :paypal_payment_type => "MyString",
      :paypal_verify_sign => "MyString",
      :paypal_payer_status => "MyString"
    ))
  end

  it "renders the edit payment form" do
    controller.stub!(:action_name).and_return("Edit")
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => payments_path(@payment), :method => "post" do
      assert_select "input#payment_amount", :name => "payment[amount]"
      assert_select "input#payment_online", :name => "payment[online]"
      assert_select "input#payment_scholarship", :name => "payment[scholarship]"
    end
  end
end
