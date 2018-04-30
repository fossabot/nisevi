# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, with: :exception

  def admin
    User.find_by_admin(:true)
  end
end
