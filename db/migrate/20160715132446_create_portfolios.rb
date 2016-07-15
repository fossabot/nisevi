class CreatePortfolios < ActiveRecord::Migration[5.0]
  def change
    create_table :portfolios do |t|
      t.references :user, foreign_key: true
      t.references :image, foreign_key: true
      t.string :client
      t.string :description
      t.string :title
      t.string :url_project
      t.date :date_project

      t.timestamps
    end
  end
end
