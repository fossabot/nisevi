class UserLink < ApplicationRecord
  belongs_to :user
  belongs_to :link

  SOCIAL_LINKS = ['github', 'stack-overflow','google-plus', 'twitter', 'linkedin']

  scope :social_links, -> { where("name ILIKE ANY (ARRAY[?])", SOCIAL_LINKS.map{|link| "%#{link}%"}) }
end
