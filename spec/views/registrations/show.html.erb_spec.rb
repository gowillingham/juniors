require 'spec_helper'

describe "registrations/show" do
  before(:each) do
    @product = Factory(:product)
    @registration = assign(:registration, stub_model(Registration,
      :first_name => "",
      :last_name => "",
      :parent_first_name => "",
      :parent_last_name => "",
      :email => "",
      :phone => "",
      :address => "",
      :city => "",
      :state => "",
      :zip => "",
      :tshirt_size => "",
      :parent_tshirt_size => "",
      :school => "",
      :grade => "",
      :note => "",
      :waiver => "",
      :parent_helper => "",
      :volleyball => "",
      :product_id => @product.id
    ))
    @payment = Factory(:payment, :registration_id => @registration.id)
  end

  context "for a signed in user" do
    it "displays the registration attributes" do
      @user = Factory(:user)
      login_user
      render

      rendered.should have_selector('h1', :content => "Details for #{@registration.name}")
      rendered.should have_selector('tr td', :content => "Product")
      rendered.should have_selector('td', :content => @registration.product.name)
      rendered.should have_selector('td', :content => @registration.email)
      rendered.should have_selector('tr td', :content => "Payment #")
      rendered.should have_selector('tr td', :content => @registration.payments.last.id.to_s)
      rendered.should have_selector('.btn', :content => 'Edit')
      rendered.should have_selector('.btn', :content => 'Destroy')
      rendered.should have_selector('.btn', :content => 'Edit payment')

      rendered.should match(/1/)
    end
  end

  context "for a signed out user" do
    it "confirms the registration/payment" do
      render

      rendered.should have_selector('h1', :content => 'Registration confirmation')
      rendered.should have_selector('td', :content => @registration.product.name)       
      rendered.should have_selector('td', :content => @registration.name)       
      rendered.should have_selector('td', :content => @registration.email)        
      rendered.should have_selector('td', :content => dollarify(@registration.balance))        
      rendered.should have_selector('td', :content => @registration.payments.last.amount.to_s)       
      rendered.should_not have_selector('.btn', :content => 'Edit')
      rendered.should_not have_selector('.btn', :content => 'Destroy')
      rendered.should_not have_selector('.btn', :content => 'Edit payment')       
    end
  end
end
