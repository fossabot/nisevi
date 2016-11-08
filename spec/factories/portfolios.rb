# == Schema Information
#
# Table name: portfolios
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  client       :string           not null
#  description  :string           not null
#  content      :text             not null
#  title        :string           not null
#  slug         :string           not null
#  url_project  :string
#  date_project :date
#  hidden       :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryGirl.define do
  factory :portfolio do
    user nil
    client Faker::Company.name
    description Faker::Hacker.say_something_smart
    content Faker::Lorem.paragraph
    hidden false
    date_project Time.now
    title Faker::Book.title
    url_project Faker::Internet.url
  end
end
