# == Schema Information
#
# Table name: phones
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  country_code :string
#  area_code    :string
#  extension    :string
#  number       :string
#  notes        :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryGirl.define do
  factory :phone do
    country_code Faker::Address.country_code
    area_code Faker::PhoneNumber.area_code
    extension Faker::PhoneNumber.extension
    number Faker::PhoneNumber.phone_number
    notes Faker::Hacker.say_something_smart
  end
end
