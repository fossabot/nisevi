class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, AuthorizationNotPerformedError, with: :user_not_authorized

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery prepend: true, with: :exception

  unless Rails.application.config.consider_all_requests_local
    rescue_from ActionView::MissingTemplate, ActionController::RoutingError, ActiveRecord::RecordNotFound, with: -> { render_404  }
  end

  def render_404
    respond_to do |format|
      format.html { render template: 'errors/404', status: 404 }
      format.all { render nothing: true, status: 404 }
    end
  end

  helper_method :social_links

  # Footer social links.
  def social_links
    # If no data was added to the database,
    # rescue the error and return an empty array
    begin
      @social_links = User.select('users.id, user_links.url, links.social_media').joins(:links)
    rescue NoMethodError => e
      @social_links = []
    end
  end

  private
    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    end

    def verify_user_is_admin
      redirect_to new_user_session_path unless current_user && current_user.try(:admin)
    end
end
