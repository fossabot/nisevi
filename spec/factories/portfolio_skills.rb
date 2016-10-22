# == Schema Information
#
# Table name: portfolio_skills
#
#  id           :integer          not null, primary key
#  portfolio_id :integer
#  skill_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryGirl.define do
  factory :portfolio_skill do
    portfolio nil
    skill nil
  end
end
