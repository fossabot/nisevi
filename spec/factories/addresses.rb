# == Schema Information
#
# Table name: addresses
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  city              :string
#  street_name       :string
#  street_number     :string
#  secondary_address :string
#  building_number   :string
#  zip_code          :string
#  time_zone         :string
#  state             :string
#  state_abbr        :string
#  country           :string
#  country_code      :string
#  notes             :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

FactoryGirl.define do
  factory :address do
    user nil
    city Faker::Address.city
    street_name Faker::Address.street_name
    street_number Faker::Number.number(10)
    secondary_address Faker::Address.secondary_address
    building_number Faker::Address.building_number
    zip_code Faker::Address.zip_code
    time_zone Faker::Address.time_zone
    state Faker::Address.state
    state_abbr Faker::Address.state_abbr
    country Faker::Address.country
    country_code Faker::Address.country_code
    notes Faker::Hacker.say_something_smart
  end
end
