# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  message    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :contact do
    name Faker::Name.name
    email Faker::Internet.email
    message Faker::Hacker.say_something_smart
  end
end
