class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def not_authenticated
  	flash[:error] = "You don't have permission for that page. Please login to access that page."
    redirect_to signin_url
  end
end
