# == Schema Information
#
# Table name: portfolios
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  client       :string
#  description  :string
#  title        :string
#  url_project  :string
#  date_project :date
#  hidden       :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Portfolio < ApplicationRecord
  belongs_to :user, inverse_of: :portfolios

  has_many :portfolio_skills
  has_many :skills, through: :portfolio_skills

  has_many :images, dependent: :destroy, inverse_of: :portfolio

  scope :published, -> { where(hidden: false) }
  scope :unpublished, -> { where(hidden: true) }


end
