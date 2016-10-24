# == Schema Information
#
# Table name: images
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  identity_id  :integer
#  article_id   :integer
#  service_id   :integer
#  portfolio_id :integer
#  url          :text             not null
#  path         :text             not null
#  active       :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Image < ApplicationRecord
  belongs_to :user, inverse_of: :images
  belongs_to :identity, inverse_of: :images
  belongs_to :article, inverse_of: :images
  belongs_to :service, inverse_of: :images
  belongs_to :portfolio, inverse_of: :images

  validates :url, :path, presence: true

  scope :active, -> { where(active: true) }
  scope :deactivated, -> { where(active: false) }
end
