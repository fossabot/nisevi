class CreateUserSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :user_skills do |t|
      t.references :user, index: true, foreign_key: true
      t.references :skill, index: true, foreign_key: true
      t.text :description
      t.string :url_skill
      t.date  :date_user_skill

      t.timestamps
    end
  end
end
