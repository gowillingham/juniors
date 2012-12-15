require 'spec_helper'

describe Payment do
  before(:each) do
  	@product = Factory(:product)
  	@registration = Factory(:registration, :product_id => @product.id)
  	@attr ={
	    :registration_id => @registration.id,
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

  context "validations" do

    it "should require a registration" do
      Payment.new(@attr.merge(:registration_id => nil)).should_not be_valid
    end
  end

  context "method" do

    context ".paid?" do

      it "exists" do
        Payment.create(@attr).should respond_to(:paid?)
      end

      it "should be true if scholarship is true or the payment amount is greater than zero" do
        payment = Payment.create(@attr.merge(:amount => 70))
        payment.paid?.should be_true
        
        payment.amount = nil
        payment.scholarship = true
        payment.save
        payment.paid?.should be_true
        
        payment.amount = 0
        payment.scholarship = true
        payment.save
        payment.paid?.should be_true
        
        payment.scholarship = false
        payment.save
        payment.paid?.should_not be_true
      end
    end

    context ".receive_paypal_payment" do

      it "exists"

      context "when acknowledged by paypal" do
        it "should update the payment when payment_status is 'Complete'"
        it "should not update the payment when mc_gross <> product.price"
        it "should not update the amount for payment_status 'Pending'"
        it "should not update the amount for payment_status 'Failed'"
      end 

      context "when not acknowledged by paypal" do
        it "should not update the payment"
      end
    end

  	context ".registration" do

      it "exists" do 
    		product = Payment.create! @attr
    		product.should respond_to(:registration)
      end
  	end
  end  
end
