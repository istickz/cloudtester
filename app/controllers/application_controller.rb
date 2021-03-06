class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
  def after_sign_in_path_for(resource)
    profile_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :lastname, :heard_how,
               :email, :password, :password_confirmation, :role)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name, :lastname,
               :email, :avatar, :password, :password_confirmation, :current_password)
    end
  end
end
