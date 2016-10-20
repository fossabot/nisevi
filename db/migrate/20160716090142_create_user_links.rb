class CreateUserLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :user_links do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :link, index: true, foreign_key: true
      t.string :url

      t.timestamps
    end
  end
end
