class CreatePortfolioSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :portfolio_skills do |t|
      t.references :portfolio, index: true, foreign_key: true
      t.references :skill, index: true, foreign_key: true

      t.timestamps
    end
  end
end
