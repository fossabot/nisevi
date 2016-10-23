class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.references :user, index: true, foreign_key: true
      t.references :identity, index: true, foreign_key: true
      t.references :article, index: true, foreign_key: true
      t.references :service, index: true, foreign_key: true
      t.references :portfolio, index: true, foreign_key: true
      t.text :url
      t.text :path
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
