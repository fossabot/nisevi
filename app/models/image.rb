# == Schema Information
#
# Table name: images
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  identity_id :integer
#  article_id  :integer
#  service_id  :integer
#  url         :text
#  path        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Image < ApplicationRecord
  belongs_to :user, inverse_of: :images
  belongs_to :identity, inverse_of: :images
  belongs_to :article, inverse_of: :images
  belongs_to :service, inverse_of: :images

  scope :hidden, -> { where(active: false) }
  scope :visible, -> { where(active: true) }
end
