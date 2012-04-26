require 'spec_helper'

describe ProductsController do
  def valid_attributes
    { :name => 'New product' } 
  end

  before(:each) do
    @user = Factory(:user)
    login_user
  end

  describe "GET index" do
    it "should reject unauthenticated access" do
      logout_user
      get :index
      response.should redirect_to(signin_path)
    end

    it "assigns all products as @products" do
      product = Product.create! valid_attributes
      get :index
      assigns(:products).should eq([product])
    end
  end

  describe "GET show" do
    it "should reject unauthenticated access" do
      product = Product.create! valid_attributes
      logout_user
      get :show, :id => product
      response.should redirect_to(signin_path)
    end

    it "assigns the requested product as @product" do
      product = Product.create! valid_attributes
      get :show, :id => product
      assigns(:product).should eq(product)
    end
  end

  describe "GET new" do
    it "should reject unauthenticated access" do
      logout_user
      get :new
      response.should redirect_to(signin_path)
    end

    it "assigns a new product as @product" do
      get :new
      assigns(:product).should be_a_new(Product)
    end
  end

  describe "GET edit" do
    it "should reject unauthenticated access" do
      product = Product.create! valid_attributes
      logout_user
      get :edit, :id => product
      response.should redirect_to(signin_path)
    end

    it "assigns the requested product as @product" do
      product = Product.create! valid_attributes
      get :edit, :id => product
      assigns(:product).should eq(product)
    end
  end

  describe "POST create" do
    it "should reject unauthenticated access" do
      product = Product.create! valid_attributes
      logout_user
      post :create, :product => product
      response.should redirect_to(signin_path)
    end

    describe "with valid params" do      
      it "creates a new Product" do
        lambda do
          post :create, :product => valid_attributes
        end.should change(Product, :count).by(1)
      end

      it "assigns a newly created product as @product" do
        post :create, :product => valid_attributes
        assigns(:product).should be_a(Product)
        assigns(:product).should be_persisted
      end

      it "redirects to the created product" do
        post :create, :product => valid_attributes
        response.should redirect_to(Product.last)
      end
    end

    describe "with invalid params" do
      it "should reject unauthenticated access" do
        product = Product.create! valid_attributes
        logout_user
        post :update, :id => product, :product => product
        response.should redirect_to(signin_path)
      end

      it "assigns a newly created but unsaved product as @product" do
        # Trigger the behavior that occurs when invalid params are submitted
        Product.any_instance.stub(:save).and_return(false)
        post :create, :product => {}
        assigns(:product).should be_a_new(Product)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Product.any_instance.stub(:save).and_return(false)
        post :create, :product => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    it "should reject unauthenticated access" do
      product = Product.create! valid_attributes
      logout_user
      put :update, :id => product, :product => valid_attributes
      response.should redirect_to(signin_path)
    end

    describe "with valid params" do
      it "updates the requested product" do
        product = Product.create! valid_attributes
        put :update, :id => product, :product => { :name => "New name"}
        assigns(:product).name.should eq("New name") 
      end

      it "assigns the requested product as @product" do
        product = Product.create! valid_attributes
        put :update, :id => product, :product => valid_attributes
        assigns(:product).should eq(product)
      end

      it "redirects to the product" do
        product = Product.create! valid_attributes
        put :update, :id => product, :product => valid_attributes
        response.should redirect_to(product)
      end
    end

    describe "with invalid params" do
      it "assigns the product as @product" do
        product = Product.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Product.any_instance.stub(:save).and_return(false)
        put :update, :id => product, :product => valid_attributes.merge(:name => nil)
        assigns(:product).should eq(product)
      end

      it "re-renders the 'edit' template" do
        product = Product.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Product.any_instance.stub(:save).and_return(false)
        put :update, :id => product, :product => valid_attributes.merge(:name => nil)
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "should reject unauthenticated access" do
      product = Product.create! valid_attributes
      logout_user
      delete :destroy, :id => product
      response.should redirect_to(signin_path)
    end

    it "destroys the requested product" do
      product = Product.create! valid_attributes
      lambda do
        delete :destroy, :id => product
      end.should change(Product, :count).by(-1)
    end

    it "redirects to the products list" do
      product = Product.create! valid_attributes
      delete :destroy, :id => product
      response.should redirect_to(products_url)
    end
  end

end
