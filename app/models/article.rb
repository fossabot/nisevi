# == Schema Information
#
# Table name: articles
#
#  id               :integer          not null, primary key
#  title            :string
#  description      :text
#  content          :text
#  published        :boolean          default(FALSE)
#  publication_date :date
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Article < ApplicationRecord
  belongs_to :user, inverse_of: :articles

  has_many :article_categories, dependent: :destroy
  has_many :categories, through: :article_categories

  has_many :comments, dependent: :destroy, inverse_of: :article
  has_many :images, dependent: :destroy, inverse_of: :article

  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true

  scope :visible, -> { where(published: true) }
end
