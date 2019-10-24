class ApplicationController < ActionController::Base
  helper_method :mobile?
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :description, :invite_code, :invite_id, :agree, :email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :description, :invite_code, :invite_id, :agree, :email, :password, :current_password])
  end
  
  private
  def mobile? # has to be in here because it has access to "request"
    request.user_agent =~ /\b(Android|iPhone|iPad|Windows Phone|Opera Mobi|Kindle|BackBerry|PlayBook)\b/i
  end
end
