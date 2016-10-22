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

require 'rails_helper'

RSpec.describe PortfolioSkill, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
