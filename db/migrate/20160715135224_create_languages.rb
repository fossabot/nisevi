class CreateLanguages < ActiveRecord::Migration[5.0]
  def change
    create_table :languages do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name, limit: 200, null: false
      t.text :description
      t.string :url_language, limit: 200
      t.date :obtained

      t.timestamps
    end
  end
end
