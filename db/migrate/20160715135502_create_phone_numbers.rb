class CreatePhoneNumbers < ActiveRecord::Migration[5.0]
  def change
    create_table :phone_numbers do |t|
      t.references :user, foreign_key: true
      t.string :phone_number
      t.string :description

      t.timestamps
    end
  end
end