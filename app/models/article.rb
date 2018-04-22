# == Schema Information
#
# Table name: articles
#
#  id               :bigint(8)        not null, primary key
#  title            :string           not null
#  slug             :string           not null
#  description      :text             not null
#  content          :text             not null
#  published        :boolean          default(FALSE), not null
#  accept_comments  :boolean          default(TRUE), not null
#  publication_date :date             not null
#  user_id          :bigint(8)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Article < ApplicationRecord
  belongs_to :user, inverse_of: :articles

  has_many :article_categories, dependent: :destroy
  has_many :categories, through: :article_categories

  has_many :comments, dependent: :destroy, inverse_of: :article
  has_many :images, as: :imageable, dependent: :destroy

  include Slug
  include Stringify

  validates :title, presence: true, length: { maximum: 100 }
  validates :content, :description, :content, presence: true

  scope :published, -> { where(published: true) }
  scope :unpublished, -> { where(published: false) }
end
