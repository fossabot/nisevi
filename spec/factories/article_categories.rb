# == Schema Information
#
# Table name: article_categories
#
#  id          :integer          not null, primary key
#  article_id  :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :article_category do
    article nil
    category nil
  end
end
