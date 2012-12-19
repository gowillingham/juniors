class PaymentsController < ApplicationController
  include ActiveMerchant::Billing::Integrations

  before_filter :require_login, :except => [:paypal, :ipn]

  def ipn
    @registration = Registration.find(params[:item_number])
    notify = Paypal::Notification.new(request.raw_post)   
      
    if @registration.payments.first.receive_paypal_payment(params, notify)
      UserMailer.customer_notification_for_registration_payment(@registration).deliver
    end
    
    render :nothing => true
    # render :layout => false # debug
  end

  def paypal
    @payment = Payment.find params[:id]
    @registration = @payment.registration
  end 

  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @payments }
    end
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
    @payment = Payment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @payment }
    end
  end

  # GET /payments/1/edit
  def edit
    @payment = Payment.find(params[:id])
  end

  # PUT /payments/1
  # PUT /payments/1.json
  def update
    @payment = Payment.find(params[:id])

    respond_to do |format|
      if @payment.update_attributes(params[:payment])
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy

    respond_to do |format|
      format.html { redirect_to payments_url }
      format.json { head :no_content }
    end
  end
end
