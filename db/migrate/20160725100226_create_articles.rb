class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.text :description, null: false
      t.text :content, null: false
      t.boolean :published, default: false
      t.boolean :accept_comments, default: true
      t.date :publication_date
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :articles, :slug, unique: true
  end
end
