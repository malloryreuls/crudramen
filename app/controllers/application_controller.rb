class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ApplicationHelper

  def authenticate_customer
  	if !signed_in?
  		flash[:danger] = "You must sign in to use this feature"
  		redirect_to new_sessions_path
  	end
  end

  def sign_out
  	session.delete(:remember_token)
  	@current_customer = nil
  end

  def sign_in(customer)
  	session[:remember_token] = customer.id
  	@current_customer = customer
  end

end
