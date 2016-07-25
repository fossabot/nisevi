class Service < ApplicationRecord
  belongs_to :user

  scope :visible, -> { where(hidden: false) }
end
