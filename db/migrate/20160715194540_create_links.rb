class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.string :name

      t.timestamps
    end
    add_index :links, :name, unique: true
  end
end