class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :check_omniauth_provider?

  def check_omniauth_provider?
    session[:check_omniauth_provider].present?
  end
end
