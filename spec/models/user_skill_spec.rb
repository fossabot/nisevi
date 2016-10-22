# == Schema Information
#
# Table name: user_skills
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  skill_id        :integer
#  description     :text
#  url_skill       :string
#  date_user_skill :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe UserSkill, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
