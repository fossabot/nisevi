class ManagementConsoleController < ApplicationController
  before_action :verify_user_is_admin

  def index
  end
end
