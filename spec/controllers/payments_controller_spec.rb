require 'spec_helper'

describe PaymentsController do
  before(:each) do
    @user = Factory(:user)
    login_user

    @product = Factory(:product)
    @registration = Factory(:registration, :product_id => @product.id)
  end
  
  def valid_attributes
    {
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

  describe "GET index" do
    it "should reject un-authenticated access" do
      logout_user
      get :index
      response.should redirect_to(signin_path)
    end

    it "assigns all payments as @payments" do
      payment = Payment.create! valid_attributes
      get :index
      assigns(:payments).should eq([payment])
    end
  end

  describe "GET show" do
    it "should reject un-authenticated access" do
      logout_user
      payment = Payment.create! valid_attributes
      get :show, :id => payment
      response.should redirect_to(signin_path)
    end

    it "assigns the requested payment as @payment" do
      payment = Payment.create! valid_attributes
      get :show, :id => payment
      assigns(:payment).should eq(payment)
    end
  end

  describe "GET edit" do
    it "should reject un-authenticated access" do
      logout_user
      payment = Payment.create! valid_attributes
      get :edit, :id => payment
      response.should redirect_to(signin_path)
    end

    it "assigns the requested payment as @payment" do
      payment = Payment.create! valid_attributes
      get :edit, :id => payment
      assigns(:payment).should eq(payment)
    end
  end

  describe "GET paypal" do
    it "assigns the requested payment a @payment" do
      payment = Payment.create! valid_attributes
      get :paypal, :id => payment
      assigns(:payment).should eq(payment)
    end 
  end

  describe "PUT update" do
    it "should reject un-authenticated access" do
      logout_user
      payment = Payment.create! valid_attributes
      put :update, :id => payment, :payment => valid_attributes
      response.should redirect_to(signin_path)
    end

    describe "with valid params" do
      it "updates the requested payment" do
        payment = Payment.create! valid_attributes
        # Assuming there are no other payments in the database, this
        # specifies that the Payment created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Payment.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => payment, :payment => {'these' => 'params'}
      end

      it "assigns the requested payment as @payment" do
        payment = Payment.create! valid_attributes
        put :update, :id => payment, :payment => valid_attributes
        assigns(:payment).should eq(payment)
      end

      it "redirects to the payment" do
        payment = Payment.create! valid_attributes
        put :update, :id => payment, :payment => valid_attributes
        response.should redirect_to(payment)
      end
    end

    describe "with invalid params" do
      it "assigns the payment as @payment" do
        payment = Payment.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Payment.any_instance.stub(:save).and_return(false)
        put :update, :id => payment, :payment => {}
        assigns(:payment).should eq(payment)
      end

      it "re-renders the 'edit' template" do
        payment = Payment.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Payment.any_instance.stub(:save).and_return(false)
        put :update, :id => payment, :payment => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "should reject un-authenticated access" do
      logout_user
      payment = Payment.create! valid_attributes
      delete :destroy, :id => payment
      response.should redirect_to(signin_path)
    end

    it "destroys the requested payment" do
      payment = Payment.create! valid_attributes
      expect {
        delete :destroy, :id => payment
      }.to change(Payment, :count).by(-1)
    end

    it "redirects to the payments list" do
      payment = Payment.create! valid_attributes
      delete :destroy, :id => payment
      response.should redirect_to(payments_url)
    end
  end

end
