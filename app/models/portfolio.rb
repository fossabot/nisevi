# == Schema Information
#
# Table name: portfolios
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  client       :string           not null
#  description  :string           not null
#  title        :string           not null
#  slug         :string           not null
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

  include Slug

  validates :client, :description, :title, presence: true

  scope :published, -> { where(hidden: false) }
  scope :unpublished, -> { where(hidden: true) }
end
