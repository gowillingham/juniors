require 'spec_helper'

describe Payment do
  before(:each) do
  	@product = Factory(:product)
  	@registration = Factory(:registration, :product_id => @product.id)
  	@attr ={
	    :registrations_id => @registration.id,
	    :amount => 7000,
	    :online => true,
	    :scholarship => true,                  
	    :paypal_txn_id => 'val',
	    :paypal_txn_type => 'val',
	    :paypal_mc_fee => 'val',
	    :paypal_sandbox => 'val',
	    :paypal_payment_status => 'val',
	    :paypal_pending_status_reason => 'val',
	    :paypal_payment_type => 'val',
	    :paypal_verify_sign => 'val',
	    :paypal_payer_status => 'val',
  	}
  end

  it "should create a payement" do
  	lambda do
  		Payment.create! @attr
  	end.should change(Payment, :count).by(1)
  end

  context "methods" do
  	it "includes .registration" do
  		product = Payment.create! @attr
  		product.should respond_to(:registration)
  	end
  end
end
