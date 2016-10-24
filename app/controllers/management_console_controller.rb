class ManagementConsoleController < ApplicationController
  before_action :verify_user_is_admin

  def index
    @profile = User.find_by_admin(:true)
    @users = User.all.order('id DESC').page(params[:page_users]).per(5)
    @services = Service.all.order('id DESC').page(params[:page_services]).per(5)
    @works = Portfolio.all.order('id DESC').page(params[:page_works]).per(5)
    @articles = Article.all.order('id DESC').page(params[:page_articles]).per(5)
    @comments = Comment.all.order('id DESC').page(params[:page_comments]).per(5)

    respond_to do |format|
      format.html {}
      format.js { render action: 'paginate_users' } if params[:page_users]
      format.js { render action: 'paginate_services' } if params[:page_services]
      format.js { render action: 'paginate_works' } if params[:page_works]
      format.js { render action: 'paginate_articles' } if params[:page_articles]
      format.js { render action: 'paginate_comments' } if params[:page_comments]
    end
  end
end
