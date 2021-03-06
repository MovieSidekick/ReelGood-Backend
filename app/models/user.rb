class User < ActiveRecord::Base
  has_secure_password
  include Amistad::FriendModel

  before_validation :ensure_auth_token!
  validates_presence_of :user_name
  validates_uniqueness_of :email
  validates_format_of :email, with: /.+@.+\..+/
  validates :auth_token, presence: true, uniqueness: true

  has_many :reviews
  has_many :movies, through: :reviews

  def ensure_auth_token!
    if self.auth_token.blank?
      self.auth_token = User.generate_token
    end
  end

  def self.generate_token
      token = SecureRandom.hex
      while User.exists?(auth_token: token)
      token = SecureRandom.hex
    end
    token
  end
end

