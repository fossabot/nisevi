class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.text :description, null: false
      t.text :content, null: false
      t.boolean :published, default: false, null: false
      t.boolean :accept_comments, default: true, null: false
      t.date :publication_date, null: false
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :articles, :slug, unique: true
  end
end
