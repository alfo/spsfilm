class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user
  
  	protected
	def current_user
		@current_user ||= User.find(cookies.signed[:current_user]) if cookies.signed[:current_user]
	end
	
	def only_if_logged_in
		redirect_to(root_path, :notice => "Please log in first") and return unless current_user
	end
	
	def only_if_logged_out
		redirect_to(adverts_path, :notice => "You are already logged in") and return if current_user
	end
end
