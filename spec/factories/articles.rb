# == Schema Information
#
# Table name: articles
#
#  id               :integer          not null, primary key
#  title            :string           not null
#  slug             :string           not null
#  description      :text             not null
#  content          :text             not null
#  published        :boolean          default(FALSE)
#  accept_comments  :boolean          default(TRUE)
#  publication_date :date
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

FactoryBot.define do
  factory :article do
    user nil
    title Faker::Name.title
    description Faker::Hacker.say_something_smart
    content Faker::Lorem.paragraph
    published true
    accept_comments true
    publication_date Time.now
  end
end
