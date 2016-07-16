class CreatePortfolioSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :portfolio_skills do |t|
      t.string :name
      t.references :portfolio, foreign_key: true

      t.timestamps
    end
  end
end
