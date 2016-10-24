class CreatePortfolios < ActiveRecord::Migration[5.0]
  def change
    create_table :portfolios do |t|
      t.references :user, index: true, foreign_key: true
      t.string :client, null: false
      t.string :description, null: false
      t.string :title, null: false
      t.string :url_project
      t.date :date_project
      t.boolean :hidden

      t.timestamps
    end
  end
end
