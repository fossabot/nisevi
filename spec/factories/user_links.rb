# == Schema Information
#
# Table name: user_links
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  link_id    :integer
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :user_link do
    user nil
    link nil
    url Faker::Internet.url
  end
end
