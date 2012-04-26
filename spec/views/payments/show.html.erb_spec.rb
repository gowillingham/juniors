require 'spec_helper'

describe "payments/show" do
  before(:each) do
    @payment = assign(:payment, stub_model(Payment,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/Paypal Txn/)
    rendered.should match(/Paypal Txn Type/)
    rendered.should match(/Paypal Mc Fee/)
    rendered.should match(/Paypal Sandbox/)
    rendered.should match(/Paypal Payment Status/)
    rendered.should match(/Paypal Pending Status Reason/)
    rendered.should match(/Paypal Payment Type/)
    rendered.should match(/Paypal Verify Sign/)
    rendered.should match(/Paypal Payer Status/)
  end
end
