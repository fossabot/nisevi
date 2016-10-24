class CreateSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :skills do |t|
      t.string :superpower, null: false

      t.timestamps
    end
    add_index :skills, :superpower, unique: true
  end
end
