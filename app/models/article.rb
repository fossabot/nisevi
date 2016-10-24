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

  after_create :update_slug
  before_update :assign_slug

  validates :title, presence: true, length: { maximum: 100 }
  validates :content, :slug, :description, :content, presence: true

  scope :published, -> { where(published: true) }
  scope :unpublished, -> { where(published: false) }

	def to_param
		slug
	end

  private
		def assign_slug
		  self.slug = "#{id}-#{title.parameterize}"
		end

		def update_slug
			update_attributes slug: assign_slug
		end
end
