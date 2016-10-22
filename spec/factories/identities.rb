# == Schema Information
#
# Table name: identities
#
#  id         :integer          not null, primary key
#  provider   :string
#  uid        :string
#  token      :string
#  secret     :string
#  image_path :string
#  image_url  :string
#  expires    :boolean
#  expires_at :date
#  raw_info   :jsonb            not null
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :identity do
    user nil
    provider Faker::Color.color_name
    uid Faker::Lorem.characters
    token Faker::Lorem.characters
    secret Faker::Lorem.characters
    image_url Faker::Avatar.image
    image_path Faker::File.file_name('path/to')
    expires false
    expires_at nil
    raw_info {}
  end
end