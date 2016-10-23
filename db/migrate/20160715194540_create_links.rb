class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.string :social_media

      t.timestamps
    end
    add_index :links, :social_media, unique: true
  end
end