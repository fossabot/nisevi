# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  topic      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :category do
	  topic Faker::Color.color_name
  end
end
