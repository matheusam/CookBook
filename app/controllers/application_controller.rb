class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:photo])
    update_attrs = %i[password password_confirmation current_password]
    devise_parameter_sanitizer.permit(:account_update, keys: update_attrs)
  end
end
