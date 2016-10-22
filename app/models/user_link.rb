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

class UserLink < ApplicationRecord
  belongs_to :user
  belongs_to :link

  SOCIAL_LINKS = %w(github stack-overflow google-plus twitter linkedin)

  scope :social_links, -> { where("name ILIKE ANY (ARRAY[?])", SOCIAL_LINKS.map{|link| "%#{link}%"}) }
end
