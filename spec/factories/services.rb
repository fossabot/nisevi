# == Schema Information
#
# Table name: services
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  title       :string
#  description :string
#  image_path  :string
#  image_url   :string
#  hidden      :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :service do
    user nil
    hidden false
    title Faker::Name.title
    image_url Faker::Avatar.image
    image_path Faker::File.file_name('path/to')
    description Faker::Hacker.say_something_smart
  end
end
