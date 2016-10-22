# == Schema Information
#
# Table name: services
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  title       :string
#  description :string
#  active      :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Service < ApplicationRecord
  belongs_to :user, inverse_of: :services

  has_many :images, dependent: :destroy, inverse_of: :service

  scope :visible, -> { where(active: false) }
end
