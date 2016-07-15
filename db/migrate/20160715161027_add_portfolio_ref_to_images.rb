class AddPortfolioRefToImages < ActiveRecord::Migration[5.0]
  def change
    add_reference :images, :portfolio, foreign_key: true
  end
end
