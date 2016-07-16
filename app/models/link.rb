class Link < ApplicationRecord
  has_many :user_links
  has_many :users, through: :user_links

  SOCIAL_LINKS = ['github', 'stack-overflow','google-plus', 'twitter', 'linkedin']

  scope :social_links, -> { where("name ILIKE ANY (ARRAY[?])", SOCIAL_LINKS.map{|link| "%#{link}%"}) }
end
