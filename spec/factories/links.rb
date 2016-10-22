# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :link do
    name Faker::Team.creature
  end
end
