class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

	before_action :configure_devise_params, if: :devise_controller?

	  def configure_devise_params
	  	devise_parameter_sanitizer.permit(:sign_up)do |user|
	  	user.permit(:name, :last_name, :admin , :num_celular, :email, :password, :password_confirmation)
	  	end
	  end
end
