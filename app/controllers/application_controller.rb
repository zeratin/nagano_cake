class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller?

protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :phone_number, :address, :email])


    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :phone_number, :address, :email])

    return unless customer_signed_in? && @current_customer.is_deleted?
    sign_out
    redirect_to root_path
  end
end
