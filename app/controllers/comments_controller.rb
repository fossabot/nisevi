class CommentsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params.merge(user: current_user))
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    if current_user and @comment.user_id == current_user.id
      @comment.destroy
      redirect_to article_path(@article)
    else
      raise Pundit::NotAuthorizedError
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
