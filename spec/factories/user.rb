# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string
#  last_name              :string
#  location               :string
#  image_path             :string
#  image_url              :string
#  email                  :string           not null
#  encrypted_password     :string           not null
#  username               :string
#  admin                  :boolean          default(FALSE)
#  presentation           :text
#  date_of_birth          :date
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

FactoryBot.define do
  factory :user do
    first_name Faker::Name.name
    last_name Faker::Name.last_name
    date_of_birth Time.new
    location Faker::Pokemon.location
    presentation Faker::Hacker.say_something_smart
    email Faker::Internet.email
    username Faker::Internet.user_name
    password 'password'
    password_confirmation 'password'
    admin false
  end

  factory :admin, class: User do
    first_name Faker::Name.name
    last_name Faker::Name.last_name
    date_of_birth Time.new
    location Faker::Pokemon.location
    presentation Faker::Hacker.say_something_smart
    email Faker::Internet.email
    username Faker::Internet.user_name
    password 'password'
    password_confirmation 'password'
    admin true
  end
end