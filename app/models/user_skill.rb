# == Schema Information
#
# Table name: user_skills
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  skill_id    :integer
#  description :text
#  url         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class UserSkill < ApplicationRecord
  belongs_to :user
  belongs_to :skill
end
