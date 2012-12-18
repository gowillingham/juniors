require 'spec_helper'

describe PaymentsController do
  before(:each) do
    @user = Factory(:user)
    login_user

    @product = Factory(:product)
    @registration = Factory(:registration, 
      :product_id => @product.id,
      :volleyball => false
    )
  end
  
  def valid_attributes
    {
      :registration_id => @registration.id,
      :amount => 7000,
      :online => true,
      :scholarship => true,                  
      :paypal_txn_id => '9JU83038HS278211W',
      :paypal_txn_type => 'web_accept',
      :paypal_mc_fee => '5.52',
      :paypal_sandbox => 'val',
      :paypal_payment_status => 'Completed',
      :paypal_pending_status_reason => 'echeck',
      :paypal_payment_type => 'instant',
      :paypal_verify_sign => 'AZQLcOZ7B.YM2m-QDAXOrQQcLFYuA0N0XoC3zadaGhkGNF2nlRWmpzlI'
    }
  end

  describe "POST ipn" do
    before(:each) do
      @payment = Payment.create! valid_attributes.merge(:amount => 0)
    end

    it "should allow un-authenticated access" do
      logout_user
      post :ipn, :item_number => @registration.id, :payment_status => 'Completed', :mc_gross => '70.00'
      response.should be_success
    end

    context "for a valid request" do

      it "should update the payment" do
        post :ipn, :item_number => @registration.id, :payment_status => 'Completed', :mc_gross => '70.00', :payment_type => 'new_value'
        @payment.reload.paypal_payment_type.should eq('new_value')
        @payment.reload.amount.should eq(7000)
      end

      it "should send a confirmation message" do
        expect {
          post :ipn, :item_number => @registration.id, :payment_status => 'Completed', :mc_gross => '70.00', :payment_type => 'new_value'
        }.to change{ ActionMailer::Base.deliveries.count }.by(1)
      end 
    end

    context "for an invalid request" do

      context "with mc_gross <> registration.total_price" do

        it "should not update the payment" do
          post :ipn, :item_number => @registration.id, :payment_status => 'Completed', :mc_gross => '70.01', :payment_type => 'new_value'
          @payment.reload.amount.should eq(0)
          @payment.reload.paypal_payment_type.should eq(valid_attributes[:paypal_payment_type])
        end

        it "should not send an email confirmation" do
          expect {
            post :ipn, :item_number => @registration.id, :payment_status => 'Completed', :mc_gross => '70.01'
          }.to change{ ActionMailer::Base.deliveries.count }.by(0)
        end
      end
      context "should not complete if payment_status <> 'Completed'" do

        it "should not update the payment" do 
          post :ipn, :item_number => @registration.id, :payment_status => 'Pending', :mc_gross => '70.00', :payment_type => 'new_value'
          @payment.reload.amount.should eq(0)
          @payment.reload.paypal_payment_type.should eq(valid_attributes[:paypal_payment_type])
        end

        it "should not send an email confirmation" do
          expect {
            post :ipn, :item_number => @registration.id, :payment_status => 'Pending', :mc_gross => '70.00', :payment_type => 'new_value'
          }.to change{ ActionMailer::Base.deliveries.count }.by(0)
        end
      end
    end
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
