require 'spec_helper'

describe "payments/new" do
  before(:each) do
    assign(:payment, stub_model(Payment,
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
    ).as_new_record)
  end

  it "renders new payment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => payments_path, :method => "post" do
      assert_select "input#payment_registrations_id", :name => "payment[registrations_id]"
      assert_select "input#payment_amount", :name => "payment[amount]"
      assert_select "input#payment_online", :name => "payment[online]"
      assert_select "input#payment_scholarship", :name => "payment[scholarship]"
      assert_select "input#payment_paypal_txn_id", :name => "payment[paypal_txn_id]"
      assert_select "input#payment_paypal_txn_type", :name => "payment[paypal_txn_type]"
      assert_select "input#payment_paypal_mc_fee", :name => "payment[paypal_mc_fee]"
      assert_select "input#payment_paypal_sandbox", :name => "payment[paypal_sandbox]"
      assert_select "input#payment_paypal_payment_status", :name => "payment[paypal_payment_status]"
      assert_select "input#payment_paypal_pending_status_reason", :name => "payment[paypal_pending_status_reason]"
      assert_select "input#payment_paypal_payment_type", :name => "payment[paypal_payment_type]"
      assert_select "input#payment_paypal_verify_sign", :name => "payment[paypal_verify_sign]"
      assert_select "input#payment_paypal_payer_status", :name => "payment[paypal_payer_status]"
    end
  end
end
