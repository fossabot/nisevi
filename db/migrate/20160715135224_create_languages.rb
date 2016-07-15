class CreateLanguages < ActiveRecord::Migration[5.0]
  def change
    create_table :languages do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :description
      t.string :url_languaje
      t.date :date_language

      t.timestamps
    end
  end
end
