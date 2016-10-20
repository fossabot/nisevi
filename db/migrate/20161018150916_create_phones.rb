class CreatePhones < ActiveRecord::Migration[5.0]
  def change
    create_table :phones do |t|
      t.references :user, index: true, foreign_key: true
      t.string :country_code
      t.string :area_code
      t.string :extension
      t.string :number
      t.text :notes

      t.timestamps
    end
  end
end
