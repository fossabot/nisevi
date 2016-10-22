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

FactoryGirl.define do
  factory :user_skill do
    user nil
    skill nil
    description Faker::Hacker.say_something_smart
    url_skill Faker::Internet.url
  end
end
