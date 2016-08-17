class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.text :content
      t.string :image_path
      t.string :image_url
      t.boolean :published, default: false
      t.date :publication_date
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
