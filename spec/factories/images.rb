# == Schema Information
#
# Table name: images
#
#  id             :integer          not null, primary key
#  imageable_type :string
#  imageable_id   :integer
#  url            :text             not null
#  path           :text             not null
#  active         :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

FactoryBot.define do
  factory :image do
    user nil
    identity nil
    article nil
    service nil
    url Faker::Avatar.image
    path Faker::File.file_name('path/to')
  end
end
