class User::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:username, :first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys:[:username, :first_name, :last_name])
    end
end
