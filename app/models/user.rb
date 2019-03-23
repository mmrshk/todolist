class User < ApplicationRecord
  has_secure_password

  PASSWORD_REGEX = /\A[a-zA-Z0-9]*\z/.freeze

  has_many :projects, dependent: :destroy

  validates :username, :password, :password_confirmation, presence: true
  validates :username, uniqueness: true, length: { minimum: 3, maximum: 50 }
  validates :password, length: { is: 8 }, confirmation: true
  validates :password, format: { with: PASSWORD_REGEX, message: 'Only alphanumeric allowed' }

  def authorize
    token = JsonWebToken.encode(user_id: self.id)
    time = Time.zone.now + 24.hours.to_i
    { token: token, exp: time.strftime('%m-%d-%Y %H:%M'), username: self.username,
      message: 'You are successfully logged in!' }
  end
end
