# frozen_string_literal: true

class PortfoliosController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_portfolio, only: %i[show edit update destroy]

  def index
    @portfolios = Portfolio.includes(:skills).page(params[:page]).per(6)
  end

  def show; end

  def new
    @portfolio = Portfolio.new
  end

  def edit; end

  def create
    @portfolio = Portfolio.new(portfolio_params.merge(user: admin))
    if @portfolio.save
      redirect_to @portfolio, notice: 'Portfolio was successfully created.'
    else
      render :new
    end
  end

  def update
    if @portfolio.update(portfolio_params)
      redirect_to @portfolio, notice: 'Portfolio was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @portfolio.destroy
    redirect_to portfolios_url, notice: 'Portfolio was successfully destroyed.'
  end

  private

  def set_portfolio
    @portfolio = Portfolio.find_by_slug!(params[:id])
  end

  def portfolio_params
    params.require(:portfolio).permit(
      :title,
      :description,
      :content,
      :client,
      :url_project,
      :date_project,
      :hidden
    )
  end
end
