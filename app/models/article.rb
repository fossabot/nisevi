require 'elasticsearch/model'

class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true

  scope :visible, -> { where(published: true) }
end
