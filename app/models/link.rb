class Link < ApplicationRecord
  has_many :user_links, dependent: :destroy
  has_many :users, through: :user_links
end
