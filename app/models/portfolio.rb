class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :images
  has_many :portfolio_skills
end
