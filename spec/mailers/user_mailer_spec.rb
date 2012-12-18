require "spec_helper"

describe UserMailer do

  describe "customer_notification_for_registration_payment" do
    it "should have the correct subject"
    it "should have the correct to address"
    it "should have the correct from address" 
    it "should include the parent name in the body"
  end

  describe "customer_notification_for_registration" do
    before(:each) do
      @product = Factory(:product)
      @registration = Factory(:registration, :product => @product)
      @mail = UserMailer.customer_notification_for_registration @registration
    end
    
    it "should have the correct subject" do
      @mail.subject.should =~ /#{@registration.first_name} #{@registration.last_name}/i
    end
    
    it "should have the correct :to address" do
      @mail.to.should eq([@registration.email])
    end
    
    it "should have the correct :from address" do
      @mail.from.should eq([INFO_EMAIL_ADDRESS])
    end 

    it "should include the parent name in the body" do
      @mail.body.encoded.should =~ /#{@registration.parent_first_name} #{@registration.parent_last_name}/
    end
  end

  describe "admin_notification_for_registration" do
    before(:each) do
      @product = Factory(:product)
      @registration = Factory(:registration, :product => @product)
      @mail = UserMailer.admin_notification_for_registration @registration
    end

    it "should have the correct subject" do
      @mail.subject.should =~ /#{@registration.first_name} #{@registration.last_name}/i
    end

    it "should have the correct to address" do
      @mail.to.should eq(REPORT_TO_EMAIL_LIST)
    end 

    it "should have the correct from address" do
      @mail.from.should eq([INFO_EMAIL_ADDRESS])
    end

    it "should include relevant details in the body" do
      @mail.body.encoded.should =~ /#{@registration.parent_last_name}, #{@registration.parent_first_name}/
      @mail.body.encoded.should =~ /#{@registration.last_name}, #{@registration.first_name}/
    end
  end
end