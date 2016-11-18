# == Schema Information
#
# Table name: services
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  title       :string           not null
#  slug        :string           not null
#  description :string           not null
#  content     :text             not null
#  active      :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :service do
    user nil
    title Faker::Name.title
    description Faker::Hacker.say_something_smart
    content Faker::Lorem.paragraph
    active false
  end
end
