require 'spec_helper'

describe "payments/index" do
  before(:each) do
    assign(:payments, [
      stub_model(Payment,
        :registrations_id => 1,
        :amount => 2,
        :online => false,
        :scholarship => false,
        :paypal_txn_id => "Paypal Txn",
        :paypal_txn_type => "Paypal Txn Type",
        :paypal_mc_fee => "Paypal Mc Fee",
        :paypal_sandbox => "Paypal Sandbox",
        :paypal_payment_status => "Paypal Payment Status",
        :paypal_pending_status_reason => "Paypal Pending Status Reason",
        :paypal_payment_type => "Paypal Payment Type",
        :paypal_verify_sign => "Paypal Verify Sign",
        :paypal_payer_status => "Paypal Payer Status"
      ),
      stub_model(Payment,
        :registrations_id => 1,
        :amount => 2,
        :online => false,
        :scholarship => false,
        :paypal_txn_id => "Paypal Txn",
        :paypal_txn_type => "Paypal Txn Type",
        :paypal_mc_fee => "Paypal Mc Fee",
        :paypal_sandbox => "Paypal Sandbox",
        :paypal_payment_status => "Paypal Payment Status",
        :paypal_pending_status_reason => "Paypal Pending Status Reason",
        :paypal_payment_type => "Paypal Payment Type",
        :paypal_verify_sign => "Paypal Verify Sign",
        :paypal_payer_status => "Paypal Payer Status"
      )
    ])
  end

  it "renders a list of payments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Paypal Txn".to_s, :count => 2
    assert_select "tr>td", :text => "Paypal Txn Type".to_s, :count => 2
    assert_select "tr>td", :text => "Paypal Mc Fee".to_s, :count => 2
    assert_select "tr>td", :text => "Paypal Sandbox".to_s, :count => 2
    assert_select "tr>td", :text => "Paypal Payment Status".to_s, :count => 2
    assert_select "tr>td", :text => "Paypal Pending Status Reason".to_s, :count => 2
    assert_select "tr>td", :text => "Paypal Payment Type".to_s, :count => 2
    assert_select "tr>td", :text => "Paypal Verify Sign".to_s, :count => 2
    assert_select "tr>td", :text => "Paypal Payer Status".to_s, :count => 2
  end
end
