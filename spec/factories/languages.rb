# == Schema Information
#
# Table name: languages
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  name         :string(200)      not null
#  description  :text
#  url_language :string(200)
#  obtained     :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryBot.define do
  factory :language do
    user nil
    name Faker::App.name
    description Faker::Hacker.say_something_smart
    url_language Faker::Internet.url
    obtained Time.now
  end
end
