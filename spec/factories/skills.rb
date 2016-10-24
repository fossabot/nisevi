# == Schema Information
#
# Table name: skills
#
#  id         :integer          not null, primary key
#  superpower :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :skill do
	  superpower Faker::Hacker.verb
  end
end
