class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.string :provider
      t.string :uid
      t.string :token
      t.string :secret
      t.boolean :expires
      t.date :expires_at
      t.jsonb :raw_info, null: false, default: '{}'
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
