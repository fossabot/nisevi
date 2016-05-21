class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :url
      t.text :path
      t.references :article, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
