class ManagementConsoleController < ApplicationController
  before_action :verify_user_is_admin

  def index
    @profile = User.find_by_admin(:true)
    @users = User.all.order("id DESC").page(params[:page]).per(10)
    @services = Service.all.order("id DESC").page(params[:page]).per(10)
    @works = Portfolio.all.order("id DESC").page(params[:page]).per(10)
    @articles = Article.all.order("id DESC").page(params[:page]).per(10)
    @comments = Comment.all.order("id DESC").page(params[:page]).per(10)
  end
end
