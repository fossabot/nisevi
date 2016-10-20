class Portfolio < ApplicationRecord
  belongs_to :user, inverse_of: :portfolios

  has_many :portfolio_skills
  has_many :skills, through: :portfolio_skills

  scope :visible, -> { where(hidden: false) }
end
