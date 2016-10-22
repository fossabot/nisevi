# == Schema Information
#
# Table name: portfolios
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  client       :string
#  description  :string
#  title        :string
#  image_path   :string
#  image_url    :string
#  url_project  :string
#  date_project :date
#  hidden       :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryGirl.define do
  factory :portfolio do
    hidden false
    client Faker::Company.name
    date_project Time.now
    description Faker::Hacker.say_something_smart
    title Faker::Book.title
    image_url Faker::Avatar.image
    image_path Faker::File.file_name('path/to')
    url_project Faker::Internet.url
  end
end
