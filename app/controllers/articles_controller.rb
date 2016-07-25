class ArticlesController < ApplicationController
  def index
    @articles = Kaminari.paginate_array(policy_scope(Article)).page(params[:page])
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    authorize @article
  end

  def edit
    @article = Article.find(params[:id])
    authorize @article
  end

  def create
    @article = Article.new(article_params.merge(user: current_user))
    authorize @article
    if @article.save
      render json: @article
    else
			render json: @article.errors, status: :unprocessable_entity
    end
  end

  def update
    @article = Article.find(params[:id])
    authorize @article
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    authorize @article
    @article.destroy
    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :content)
    end
end
