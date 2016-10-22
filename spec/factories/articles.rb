# == Schema Information
#
# Table name: articles
#
#  id               :integer          not null, primary key
#  title            :string
#  description      :text
#  content          :text
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
    publication_date Time.now
  end
end
