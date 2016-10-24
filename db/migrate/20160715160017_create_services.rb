class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title, null: false
      t.string :description, null: false
      t.boolean :active, default: false

      t.timestamps
    end
  end
end