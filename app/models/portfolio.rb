class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :portfolio_skills

  scope :visible, -> { where(hidden: false) }
end
