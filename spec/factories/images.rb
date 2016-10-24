# == Schema Information
#
# Table name: images
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  identity_id  :integer
#  article_id   :integer
#  service_id   :integer
#  portfolio_id :integer
#  url          :text             not null
#  path         :text             not null
#  active       :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryGirl.define do
  factory :image do
    user nil
    identity nil
    article nil
    service nil
    url Faker::Avatar.image
    path Faker::File.file_name('path/to')
  end
end
