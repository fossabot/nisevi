# == Schema Information
#
# Table name: identities
#
#  id         :integer          not null, primary key
#  provider   :string           not null
#  uid        :string           not null
#  token      :string
#  secret     :string
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
    expires false
    expires_at nil
    raw_info {}
  end
end
