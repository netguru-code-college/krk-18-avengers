class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise.parameters.sinitizer.permit(:sign_up, keys: [:nick])
  end
end
