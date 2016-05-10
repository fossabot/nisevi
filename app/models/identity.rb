class Identity < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider

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
