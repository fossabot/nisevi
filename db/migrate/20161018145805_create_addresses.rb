class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.references :user, index: true, foreign_key: true
      t.string :city, null: false
      t.string :street_name, null: false
      t.string :street_number, null: false
      t.string :secondary_address
      t.string :building_number
      t.string :zip_code, null: false
      t.string :time_zone
      t.string :state
      t.string :state_abbr
      t.string :country
      t.string :country_code
      t.text :notes

      t.timestamps
    end
  end
end
