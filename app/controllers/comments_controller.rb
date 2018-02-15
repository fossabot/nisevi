class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @article = Article.find_by_slug!(params[:article_id])
    @comment = @article.comments.new(comment_params.merge(user: current_user))
    respond_to do |format|
      if verify_recaptcha(model: @comment) && @comment.save
        @comments = @article.comments.order('id DESC').page(params[:page]).per(5)
        format.html { redirect_to @article, notice: 'Comment was successfully created.' }
        format.js   { }
      else
        flash[:error] = 'The comment was not created.'
        redirect_to request.referer || root_path
      end
    end
  end

  def destroy
    @article = Article.find_by_slug!(params[:article_id])
    @comment = @article.comments.find(params[:id])
    if (current_user and @comment.user_id == current_user.id) || current_user.admin
      @comment.destroy
      @comments = @article.comments.order('id DESC').page(params[:page]).per(5)
      respond_to do |format|
        format.html { redirect_to article_path(@article) }
        format.json { head :no_content }
        format.js   { }
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
