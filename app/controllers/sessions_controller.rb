class SessionsController < ApplicationController
  def new
  end

  def create
  	user = login params[:session][:email], params[:session][:password], params[:session][:remember_me]
    if user
    	flash[:success] = 'Logged in!'
      redirect_back_or_to root_url
    else
      flash[:error] = "Your email and password did not match any account"
      render 'new'
    end
  end

  def destroy
  	logout
  	flash[:success] = 'Logged out!'
  	redirect_to root_url
  end
end
