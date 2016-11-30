class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  def index
    @articles = Kaminari.paginate_array(policy_scope(Article)).page(params[:page]).per(5)
  end

  # GET /articles/1
  def show
    @comments = @article.comments.order('id DESC').page(params[:page]).per(5)
  end

  # GET /articles/new
  def new
    @article = Article.new
    authorize @article
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  def create
    @article = Article.new(article_params.merge(user: current_user))
    authorize @article
    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find_by_slug!(params[:id])
      authorize @article
    end

    # Only allow a trusted parameter "white list" through.
    def article_params
      params.require(:article).permit(
        :title,
        :description,
        :content,
        :published,
        :accept_comments,
        :publication_date
      )
    end
end
