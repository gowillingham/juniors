class RegistrationsController < ApplicationController
  before_filter :require_login, :except => [:new, :show, :create]

  def confirm
    @registration = Registration.find(params[:id])
    UserMailer.customer_notification_for_registration(@registration).deliver
    
    respond_to do |format|
      format.html { 
        flash[:success] = "Confirmation sent for #{@registration.name}. "
        redirect_to @registration
      }
      format.json { head :no_content }      
    end
  end

  # GET /registrations
  # GET /registrations.json
  def index
    @registrations = Registration.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @registrations }
    end
  end

  # GET /registrations/1
  # GET /registrations/1.json
  def show
    @registration = Registration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @registration }
    end
  end

  # GET /registrations/new
  # GET /registrations/new.json
  def new
    @registration = Registration.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @registration }
    end
  end

  # GET /registrations/1/edit
  def edit
    @registration = Registration.find(params[:id])
  end

  # POST /registrations
  # POST /registrations.json
  def create
    @registration = Registration.new(params[:registration])

    respond_to do |format|
      if @registration.save

        @payment = @registration.payments.create!
        if logged_in?
          format.html { 
            flash[:success] = 'Registration was successfully created. '
            redirect_to @registration
          }
          format.json { render json: @registration, status: :created, location: @registration }
        else
          format.html {
            UserMailer.customer_notification_for_registration(@registration).deliver
            UserMailer.admin_notification_for_registration(@registration).deliver
            redirect_to paypal_payment_url(@payment)
          }
        end
      else
        format.html { render action: "new" }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /registrations/1
  # PUT /registrations/1.json
  def update
    @registration = Registration.find(params[:id])

    respond_to do |format|
      if @registration.update_attributes(params[:registration])
        format.html { 
          flash[:success] = 'Registration was successfully changed. '
          redirect_to @registration
        }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registrations/1
  # DELETE /registrations/1.json
  def destroy
    @registration = Registration.find(params[:id])
    @registration.destroy

    respond_to do |format|
      format.html { 
        flash[:success] = 'The registration was removed. '
        redirect_to registrations_url 
      }
      format.json { head :no_content }
    end
  end
end
