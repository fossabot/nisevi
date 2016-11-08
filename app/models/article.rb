# == Schema Information
#
# Table name: articles
#
#  id               :integer          not null, primary key
#  title            :string           not null
#  slug             :string           not null
#  description      :text             not null
#  content          :text             not null
#  published        :boolean          default(FALSE)
#  accept_comments  :boolean          default(TRUE)
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

  include Slug

  validates :title, presence: true, length: { maximum: 100 }
  validates :content, :description, :content, presence: true
  validate :publication_date_cannot_be_in_the_past

  scope :published, -> { where(published: true) }
  scope :unpublished, -> { where(published: false) }

  def publication_date_cannot_be_in_the_past
    if publication_date.present? && publication_date < Date.today
      errors.add(:publication_date, "can't be in the past")
    end
  end
end
