require 'spec_helper'

describe RegistrationsController do
  before(:each) do
    @product = Factory(:product)
  end

  def valid_attributes
    {
      :first_name => 'first_name', 
      :last_name => 'last_name', 
      :parent_first_name => 'parent_first_name', 
      :parent_last_name => 'parent_last_name', 
      :email => 'email@example.com', 
      :address => 'address', 
      :phone => '999 999 9999', 
      :city => 'city', 
      :state => 'state', 
      :tshirt_size => 'YL', 
      :parent_tshirt_size => 'XL', 
      :grade => '5', 
      :school => 'school', 
      :note => 'note', 
      :waiver => true, 
      :parent_helper => true, 
      :volleyball => true, 
      :product_id => @product.id
    }
  end

  describe "GET index" do
    it "assigns all registrations as @registrations" do
      registration = Registration.create! valid_attributes
      get :index
      assigns(:registrations).should eq([registration])
    end
  end

  describe "GET show" do
    it "assigns the requested registration as @registration" do
      registration = Registration.create! valid_attributes
      get :show, :id => registration
      assigns(:registration).should eq(registration)
    end
  end

  describe "GET new" do
    it "assigns a new registration as @registration" do
      get :new
      assigns(:registration).should be_a_new(Registration)
    end
  end

  describe "GET edit" do
    it "assigns the requested registration as @registration" do
      registration = Registration.create! valid_attributes
      get :edit, :id => registration, :registration => valid_attributes
      assigns(:registration).should eq(registration)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Registration" do
        expect {
          post :create, :registration => valid_attributes
        }.to change(Registration, :count).by(1)
      end

      it "assigns a newly created registration as @registration" do
        post :create, :registration => valid_attributes
        assigns(:registration).should be_a(Registration)
        assigns(:registration).should be_persisted
      end

      it "redirects to the created registration" do
        post :create, :registration => valid_attributes
        response.should redirect_to(Registration.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved registration as @registration" do
        # Trigger the behavior that occurs when invalid params are submitted
        Registration.any_instance.stub(:save).and_return(false)
        post :create, :registration => {}
        assigns(:registration).should be_a_new(Registration)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Registration.any_instance.stub(:save).and_return(false)
        post :create, :registration => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested registration" do
        registration = Registration.create! valid_attributes
        # Assuming there are no other registrations in the database, this
        # specifies that the Registration created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Registration.any_instance.should_receive(:update_attributes).with({ 'these' => 'params' })
        put :update, :id => registration, :registration => { 'these' => 'params' }
      end

      it "assigns the requested registration as @registration" do
        registration = Registration.create! valid_attributes
        put :update, :id => registration, :registration => valid_attributes
        assigns(:registration).should eq(registration)
      end

      it "redirects to the registration" do
        registration = Registration.create! valid_attributes
        put :update, :id => registration, :registration => valid_attributes
        response.should redirect_to(registration)
      end
    end

    describe "with invalid params" do
      it "assigns the registration as @registration" do
        registration = Registration.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Registration.any_instance.stub(:save).and_return(false)
        put :update, :id => registration, :registration => {}
        assigns(:registration).should eq(registration)
      end

      it "re-renders the 'edit' template" do
        registration = Registration.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Registration.any_instance.stub(:save).and_return(false)
        put :update, :id => registration, :registration => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested registration" do
      registration = Registration.create! valid_attributes
      expect {
        delete :destroy, :id => registration
      }.to change(Registration, :count).by(-1)
    end

    it "redirects to the registrations list" do
      registration = Registration.create! valid_attributes
      delete :destroy, :id => registration
      response.should redirect_to(registrations_url)
    end
  end

end
