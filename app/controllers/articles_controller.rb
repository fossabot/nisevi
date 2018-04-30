# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @articles = Article.page(params[:page]).per(5)
  end

  def show
    @comments = @article.comments.includes(:user).order('id DESC').page(params[:page]).per(5)
  end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    @article = Article.new(article_params.merge(user: admin))
    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find_by_slug!(params[:id])
  end

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
