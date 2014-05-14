module ApplicationHelper
	def current_customer
   @current_customer ||= session[:remember_token] && Customer.find(session[:remember_token])
 end

 def signed_in?
     if current_customer
      true
    else
      false
    end
  end
end
