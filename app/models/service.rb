class Service < ApplicationRecord
  belongs_to :user, inverse_of: :services

  scope :visible, -> { where(hidden: false) }
end
