class CommentsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params.merge(user: current_user))
		respond_to do |format|
			if verify_recaptcha(model: @comment) && @comment.save
        @comments = @article.comments.order('id DESC').page(params[:page]).per(5)
				format.html { redirect_to @article, notice: 'Comment was successfully created.' }
				format.js   { }
				format.json { render json: @comment, status: :created, location: @comment }
			else
				format.html { render @article }
				format.json { render json: @comment.errors, status: :unprocessable_entity }
			end
		end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    if (current_user and @comment.user_id == current_user.id) || current_user.admin
      @comment.destroy
			@comments = @article.comments.order('id DESC').page(params[:page]).per(5)
			respond_to do |format|
				format.html { redirect_to article_path(@article) }
				format.json { head :no_content }
				format.js   { }
			end
    else
      raise Pundit::NotAuthorizedError
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
