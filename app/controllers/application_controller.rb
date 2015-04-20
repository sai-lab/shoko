class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def admin_user!
    unless current_user.is_admin?
      render file: "#{Rails.root}/public/404.html", layout: false, status: 404
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) << [:email, :name]
  end
end
