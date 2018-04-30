# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, with: :exception

  unless Rails.application.config.consider_all_requests_local
    rescue_from ActionView::MissingTemplate, ActionController::RoutingError, ActiveRecord::RecordNotFound, with: -> { render_404 }
  end

  def render_404
    respond_to do |format|
      format.html { render template: 'errors/404', status: 404 }
      format.all { render nothing: true, status: 404 }
    end
  end

  helper_method :social_links, :resource_name, :resource, :devise_mapping, :profile_image

  def social_links
    User.find_by_admin(:true).user_links.includes(:link)
  end

  def resource_name
    :user
  end

  def profile_image(opts = {})
    'default.jpg'
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def after_sign_in_path_for(resource)
    request.referer ? URI.parse(request.referer).path : root_path
  end

  def after_sign_out_path_for(resource)
    request.referer ? URI.parse(request.referer).path : root_path
  end

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end

  def verify_user_is_admin
    redirect_to new_user_session_path unless current_user&.try(:admin)
  end
end
