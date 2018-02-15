# == Schema Information
#
# Table name: skills
#
#  id         :integer          not null, primary key
#  superpower :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Skill < ApplicationRecord
  has_many :user_skills, dependent: :destroy
  has_many :users, through: :user_skills

  has_many :portfolio_skills, dependent: :destroy
  has_many :portfolios, through: :portfolio_skills

  validates :superpower, presence: true
end
