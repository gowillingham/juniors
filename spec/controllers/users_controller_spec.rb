require 'spec_helper'

describe UsersController do

  def valid_attributes
    {
      :name => 'first last',
      :email => 'email@exampel.com',
      :password => 'password', 
      :password_confirmation => 'password'
    }
  end

  describe "GET index" do
    it "assigns all users as @users" do
      user = User.create! valid_attributes
      get :index
      assigns(:users).should eq([user])
    end
  end

  describe "GET show" do
    it "assigns the requested user as @user" do
      user = User.create! valid_attributes
      get :show, :id => user
      assigns(:user).should eq(user)
    end
  end

  describe "GET new" do
    it "assigns a new user as @user" do
      get :new
      assigns(:user).should be_a_new(User)
    end
  end

  describe "GET edit" do
    it "assigns the requested user as @user" do
      user = User.create! valid_attributes
      get :edit, :id => user
      assigns(:user).should eq(user)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new User" do
        expect {
          post :create, :user => valid_attributes
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post :create, :user => valid_attributes
        assigns(:user).should be_a(User)
        assigns(:user).should be_persisted
      end

      it "redirects to the created user" do
        post :create, :user => valid_attributes
        response.should redirect_to(User.last)
      end
    end

    describe "with invalid params" do
      before(:each) do
        @invalid_attributes = valid_attributes.merge(:email => nil)
      end

      it "re-renders the 'new' template" do
        post :create, :user => @invalid_attributes
        response.should render_template("new")
      end

      it "should not create a user" do
        expect {
          post :create, :user => @invalid_attributes
        }.to change(User, :count).by(0)
      end
    end
  end

  describe "PUT update" do
    before(:each) do
      @updated_attributes = valid_attributes.merge(:email => 'new_address@example.com', :name => 'new name')
    end

    describe "with valid params" do
      it "updates the requested user" do
        user = User.create! valid_attributes
        put :update, :id => user, :user => @updated_attributes
        user.reload.email.should eq(@updated_attributes[:email])
        user.reload.name.should eq(@updated_attributes[:name])
      end

      it "assigns the requested user as @user" do
        user = User.create! valid_attributes
        put :update, :id => user, :user => @updated_attributes
        assigns(:user).should eq(user)
      end

      it "redirects to the user with message" do
        user = User.create! valid_attributes
        put :update, :id => user, :user => @updated_attributes
        response.should redirect_to(user)
        flash[:success] =~ /updated/i
      end
    end

    describe "with invalid params" do
      before(:each) do
        @invalid_attributes = valid_attributes.merge(:email => 'invalid', :name => 'new name')
      end
    
      it "assigns the user as @user" do
        user = User.create! valid_attributes
        put :update, :id => user, :user => @invalid_attributes
        assigns(:user).should eq(user)
      end

      it "should not update the user" do
        user = User.create! valid_attributes
        put :update, :id => user, :user => @invalid_attributes
        user.reload.email.should_not eq(@invalid_attributes[:email])
      end

      it "re-renders the 'edit' template" do
        user = User.create! valid_attributes
        put :update, :id => user, :user => @invalid_attributes
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested user" do
      user = User.create! valid_attributes
      expect {
        delete :destroy, :id => user
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      user = User.create! valid_attributes
      delete :destroy, :id => user
      response.should redirect_to(users_path)
    end
  end

end
