class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_user_params, :if => :devise_controller?

  def configure_user_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name])
  end
end
