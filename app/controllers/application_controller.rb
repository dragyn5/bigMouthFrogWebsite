class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, :password, :email, :password_confirmation])
        devise_parameter_sanitizer.permit(:user_update, keys: [:user_name, :password, :email])
      end
end
