# frozen_string_literal: true
# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  first_name             :string
#  last_name              :string
#  location               :string
#  email                  :string           not null
#  encrypted_password     :string           not null
#  username               :string
#  admin                  :boolean          default(FALSE)
#  presentation           :text
#  date_of_birth          :date
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord
  has_many :addresses, dependent: :destroy, inverse_of: :user
  has_many :identities, dependent: :destroy, inverse_of: :user
  has_many :phones, dependent: :destroy, inverse_of: :user
  has_many :languages, dependent: :destroy, inverse_of: :user
  has_many :portfolios, dependent: :destroy, inverse_of: :user
  has_many :services, dependent: :destroy, inverse_of: :user
  has_many :comments, dependent: :destroy, inverse_of: :user
  has_many :articles, dependent: :destroy, inverse_of: :user
  has_many :images, as: :imageable, dependent: :destroy

  has_many :user_skills, dependent: :destroy
  has_many :skills, through: :user_skills

  has_many :user_links, dependent: :destroy
  has_many :links, through: :user_links

  devise :database_authenticatable, :registerable, :omniauthable, :timeoutable,
         :confirmable, :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true, uniqueness: true

  def admin?
    admin
  end

  def freelance_site
    freelance_media = User.select('users.id, user_links.url, links.social_media')
                          .joins(:links)
                          .where('users.admin=? AND links.social_media=?', true, 'freelancer')
    return '#' if freelance_media.empty?
    freelance_media.first.url
  end

  def publications
    {
      articles: articles.published.last(3),
      portfolios: portfolios.published.last(3),
      services: services.active.last(4)
    }
  end

  class << self
    def from_omniauth(auth, signed_in_resource=nil)
      # Get the identity and user if they exist
      identity = Identity.find_with_omniauth(auth)
      identity = Identity.create_with_omniauth(auth) if identity.nil?

      user = signed_in_resource ? signed_in_resource : identity.user

      # Find or create the user if needed
      user = find_or_create_from_omniauth(auth) if user.nil?

      # Associate the identity with the user if needed
      if identity.user != user
        identity.user = user
        identity.save!
      end
      user
    end

    def find_or_create_from_omniauth(auth)
      # We try to find the user by using the email
      user = User.find_by(email: auth.info.email)
      # Create the user if it's a new registration
      user = create_from_omniauth(auth) if user.nil?
      user.skip_confirmation!
      user.save!
      user
    end

    def create_from_omniauth(auth)
      User.new(
        username: auth.info.nickname || '',
        email: auth.info.email,
        password: Devise.friendly_token,
        first_name: auth.info.first_name,
        last_name: auth.info.last_name
      )
    end
  end
end
