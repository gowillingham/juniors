require 'spec_helper'

describe SessionsController do
  def valid_credentials
    {
      :email => 'email@example.com',
      :password => 'password',
    }
  end

  before(:each) do
    @user = User.create! valid_credentials.merge(:password_confirmation => valid_credentials[:password], :name => 'first last')
  end

  describe "GET 'new'" do
    it "should be success" do
      get :new
      response.should be_success
    end
  end

  describe "POST 'create'" do
    describe "with valid credentials" do
      it "should login the user" do
        post :create, :session => valid_credentials
        controller.should be_logged_in
      end

      it "should redirect to site index" do
        post :create, :session => valid_credentials
        response.should redirect_to(root_path)
        flash[:success].should =~ /logged in/i
      end
    end

    describe "with invalid credentials" do
      before(:each) do
        @invalid_credentials = valid_credentials.merge(:password => 'invalid')
      end

      it "should not log the user in" do
        post :create, :session => @invalid_credentials
        controller.should_not be_logged_in
      end

      it "should render the new session page" do
        post :create, :session => @invalid_credentials
        response.should render_template('new')
        flash[:error].should =~ /did not match/i
      end
    end
  end

  describe "POST 'destroy'" do
    it "should logout the user" do
      login_user
      post :destroy
      controller.should_not be_logged_in
    end

    it "should redirect to site index" do
      login_user
      post :destroy
      response.should redirect_to(root_path)
      flash[:notice] = 'Logged out!'
    end
  end

end
