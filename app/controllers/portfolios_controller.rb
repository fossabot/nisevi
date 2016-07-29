class PortfoliosController < ApplicationController
  def index
    @portfolios = Kaminari.paginate_array(policy_scope(Portfolio)).page(params[:page]).per(6)
  end
end
