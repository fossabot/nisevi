class AddHiddenToPortfolio < ActiveRecord::Migration[5.0]
  def change
    add_column :portfolios, :hidden, :boolean
  end
end
