class Skill < ApplicationRecord
  has_many :user_skills, dependent: :destroy
  has_many :users, through: :user_skills

  has_many :portfolio_skills, dependent: :destroy
  has_many :portfolios, through: :portfolio_skills
end
