class CreatePortfolioSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :portfolio_skills do |t|
      t.belongs_to :portfolio, index: true, foreign_key: true
      t.belongs_to :skill, index: true, foreign_key: true

      t.timestamps
    end
  end
end
