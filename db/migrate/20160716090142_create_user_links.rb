class CreateUserLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :user_links do |t|
      t.belongs_to :user, index: true
      t.belongs_to :link, index: true
      t.string :url
      t.string :name

      t.timestamps
    end
  end
end
