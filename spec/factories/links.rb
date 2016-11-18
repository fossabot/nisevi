# == Schema Information
#
# Table name: links
#
#  id           :integer          not null, primary key
#  social_media :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryGirl.define do
  factory :link do
  social_media Faker::Team.creature
  end
end
