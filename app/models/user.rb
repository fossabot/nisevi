class User < ApplicationRecord
  has_many :articles
  has_many :comments
  has_many :identities
  has_many :phone_numbers
  has_many :languages
  has_many :portfolios
  has_many :user_skils
  has_many :skills, through: :user_skills

  # Include devise modules. Others available are ':lockable' and ':timeoutable'
  devise :database_authenticatable, :registerable, :omniauthable,
         :confirmable, :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :email
  validates_uniqueness_of :email

  def self.from_omniauth(auth, signed_in_resource=nil)
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

  def self.find_or_create_from_omniauth(auth)
    # We try to find the user by using the email
    user = User.find_by(email: auth.info.email)
    # Create the user if it's a new registration
    user = create_from_omniauth(auth) if user.nil?
    user.skip_confirmation!
    user.save!
    user
  end

  def self.create_from_omniauth(auth)
      User.new(
        username: auth.info.nickname || "",
        image: auth.info.image,
        email: auth.info.email,
        password: Devise.friendly_token,
        first_name: auth.info.first_name,
        last_name: auth.info.last_name
      )
  end
end
