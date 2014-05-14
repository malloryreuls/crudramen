class SessionsController < ApplicationController
  def new
  end

  def create
  	@customer = Customer.where(:email => params[:session][:email]).first

  		if @customer == nil || !@customer.authenticate(params[:session][:password])
  			flash[:error] = "Invalid email/pw combo"
        render 'new'
  		else
  			session[:remember_token] = @customer.id
  			@current_customer = @customer
        flash[:success] = "Welcome to Ramen"
  			redirect_to root_path
  		end
  end

  def destroy
  	session.delete(:remember_token)
  	redirect_to root_path
  end

end
