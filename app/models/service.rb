# == Schema Information
#
# Table name: services
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  title       :string           not null
#  slug        :string           not null
#  description :string           not null
#  content     :text             not null
#  active      :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Service < ApplicationRecord
  belongs_to :user, inverse_of: :services

  has_many :images, dependent: :destroy, inverse_of: :service

  include Slug

  validates :title, :description, :content, presence: true

  scope :active, -> { where(active: true) }
  scope :deactivated, -> { where(active: false) }
end
