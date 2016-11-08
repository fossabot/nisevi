class PortfoliosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]

  # GET /portfolios
  def index
    @portfolios = Kaminari.paginate_array(policy_scope(Portfolio))
                          .page(params[:page]).per(6)
  end

  # GET /portfolios/1
  def show
  end

  # GET /portfolios/new
  def new
    @portfolio = Portfolio.new
    authorize @portfolio
  end

  # GET /portfolios/1/edit
  def edit
    authorize @portfolio
  end

  # POST /portfolios
  def create
    @portfolio = Portfolio.new(portfolio_params.merge(user: current_user))
    authorize @portfolio
    if @portfolio.save
      redirect_to @portfolio, notice: 'Portfolio was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /portfolios/1
  def update
    authorize @portfolio
    if @portfolio.update(portfolio_params)
      redirect_to @portfolio, notice: 'Portfolio was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /portfolios/1
  def destroy
    authorize @portfolio
    @portfolio.destroy
    redirect_to portfolios_url, notice: 'Portfolio was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio
      @portfolio = Portfolio.find_by_slug!(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
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
