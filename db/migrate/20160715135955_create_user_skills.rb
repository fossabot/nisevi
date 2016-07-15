class CreateUserSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :user_skills do |t|
      t.belongs_to :user, index: true
      t.belongs_to :skill, index: true
      t.string :description
      t.string :url_skill
      t.date  :date_user_skill

      t.timestamps
    end
  end
end
