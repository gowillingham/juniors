require 'spec_helper'

describe Registration do
  before(:each) do
  	@product = Factory(:product)
  	@attr = {
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
      :parent_helper => false, 
      :volleyball => true, 
      :product_id => @product.id
  	}
  end

  it "creates a registration" do
  	lambda do
  		Registration.create! @attr
  	end.should change(Registration, :count).by(1)
  end

  context "methods" do
    it "include .product" do
      registration = Registration.create!(@attr)
      registration.should respond_to(:product)
    end 

    it "includes .name" do
      registration = Registration.create!(@attr)
      registration.should respond_to(:name)
    end

    it "includes .parent_name" do
      registration = Registration.create!(@attr)
      registration.should respond_to(:parent_name)
    end

    it "includes .payments" do
      registration = Registration.create! @attr
      registration.should respond_to(:payments)
    end

    it "includes .total_price" do
      registration_1 = Registration.create! @attr
      registration_1.total_price.should eq(registration_1.product.price + LITE_VOLLEYBALL_PRICE_IN_CENTS)

      registration_2 = Registration.create! @attr.merge(:volleyball => false)
      registration_2.total_price.should eq(registration_2.product.price)
    end

    context ".balance" do
      it "returns the balance of the product minus any payments" do
        product = Factory(:product, :price => 5000)
        registration = Registration.create! @attr.merge(:product_id => product.id)
        registration.payments.create!(:amount => 1000)
        registration.payments.create!(:amount => 2000)
        registration.balance.should eq(2000) 
      end
    end
  end

  context "validations" do
  	it "should require a player first name" do
  		registration = Registration.new(@attr.merge(:first_name => nil))
  		registration.should_not be_valid
  	end

  	it "should require a player last name" do
  		registration = Registration.new(@attr.merge(:last_name => nil))
  		registration.should_not be_valid
  	end

  	it "should require a parent first name" do
  		registration = Registration.new(@attr.merge(:parent_first_name => nil))
  		registration.should_not be_valid
  	end

  	it "should require a parent last name" do
  		registration = Registration.new(@attr.merge(:parent_last_name => nil))
  		registration.should_not be_valid
  	end

  	it "should require an email" do
  		registration = Registration.new(@attr.merge(:email => nil))
  		registration.should_not be_valid
  	end

  	it "should require an email of proper format" do
  		registration = Registration.new(@attr.merge(:email => 'not_email'))
  		registration.should_not be_valid
  	end

    it "should require phone of proper format" do
      registration = Registration.new(@attr.merge(:phone => 'not a phone'))
      registration.should_not be_valid
    end

  	it "should require a grade" do
  		registration = Registration.new(@attr.merge(:grade => nil))
  		registration.should_not be_valid
  	end

  	it "should require a school" do
  		registration = Registration.new(@attr.merge(:school => nil))
  		registration.should_not be_valid
  	end

  	it "should require a tshirt size" do
  		registration = Registration.new(@attr.merge(:tshirt_size => nil))
  		registration.should_not be_valid
  	end

  	it "should require a session" do
  		registration = Registration.new(@attr.merge(:product_id => nil))
  		registration.should_not be_valid
  	end

  	it "should require a parent tshirt size if parent helper is true" do
  		registration = Registration.new(@attr.merge(:parent_helper => true, :parent_tshirt_size => nil))
  		registration.should_not be_valid
  	end

  	it "should require acceptance of waiver of liability" do
  		registration = Registration.new(@attr.merge(:waiver => false))
  		registration.should_not be_valid
  	end 
  end
end
