# == Schema Information
#
# Table name: identities
#
#  id         :integer          not null, primary key
#  provider   :string           not null
#  uid        :string           not null
#  token      :string
#  secret     :string
#  expires    :boolean
#  expires_at :date
#  raw_info   :jsonb            not null
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Identity < ApplicationRecord
  belongs_to :user, inverse_of: :identities

  has_many :images, as: :imageable, dependent: :destroy

  validates :uid, :provider, :raw_info, presence: true
  validates :uid, uniqueness: { scope: :provider }

  def self.find_with_omniauth(auth)
    find_by(uid: auth.uid, provider: auth.provider)
  end

  def self.create_with_omniauth(auth)
    identity = {
      uid: auth.uid,
      provider: auth.provider,
      token: auth.credentials.token,
      secret: auth.credentials.secret,
      raw_info: auth.extra.raw_info.to_json
    }
    identity.merge(expires: auth.credentials.expires) if auth.credentials.expires
    unless auth.credentials.expires_at.blank?
       identity.merge(expires_at: Time.at(auth.credentials.expires_at))
    end
    create(identity)
  end
end
