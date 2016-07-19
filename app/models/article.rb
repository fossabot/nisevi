class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy

  validates :title, presence: true, length: { maximum: 100 }
  validates :text, presence: true

  scope :visible, -> { where(published: true) }
end
