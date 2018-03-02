class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.references :imageable, polymorphic: true, index: true
      t.text :url, null: false
      t.text :path, null: false
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
