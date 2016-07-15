class Service < ApplicationRecord
  belongs_to :user
  has_many :images

  scope :visible, -> { where(hidden: false) }
end
