# == Schema Information
#
# Table name: portfolio_skills
#
#  id           :integer          not null, primary key
#  portfolio_id :integer
#  skill_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class PortfolioSkill < ApplicationRecord
  belongs_to :portfolio
  belongs_to :skill
end
