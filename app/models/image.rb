# == Schema Information
#
# Table name: images
#
#  id             :integer          not null, primary key
#  imageable_type :string
#  imageable_id   :integer
#  url            :text             not null
#  path           :text             not null
#  active         :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true

  validates :url, :path, presence: true

  scope :active, -> { where(active: true) }
  scope :deactivated, -> { where(active: false) }
end
