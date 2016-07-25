class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :description
      t.string :image_path
      t.string :image_url
      t.boolean :hidden, default: false

      t.timestamps
    end
  end
end