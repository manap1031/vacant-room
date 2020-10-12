class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
 

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:owner_name, :owner_name_kana, :gender, :birthday, :prefecture_id, :postal_code, :city, :town, :building, :phone_number, :company_name, :company_name_kana, :company_postal_code, :company_city, :company_town, :company_building, :company_phone_number,])
  end
end
