require 'spec_helper'

describe "payments/paypal" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :name => 'MyString'
    ))
    @registration = assign(:registration, stub_model(Registration,
      :player_first_name => 'MyString',
      :total_price => '7000',
      :product => @product
    ))
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

  it "renders the make payment to paypal form" do
    controller.stub!(:action_name).and_return("Paypal")
    render
  end
end
