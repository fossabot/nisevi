# == Schema Information
#
# Table name: articles
#
#  id               :integer          not null, primary key
#  title            :string
#  description      :text
#  content          :text
#  image_path       :string
#  image_url        :string
#  published        :boolean          default(FALSE)
#  publication_date :date
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

FactoryGirl.define do
  factory :article do
    user nil
    published true
    title Faker::Name.title
    description Faker::Hacker.say_something_smart
    content Faker::Lorem.paragraph
    image_url Faker::Avatar.image
    image_path Faker::File.file_name('path/to')
    publication_date Time.now
  end
end