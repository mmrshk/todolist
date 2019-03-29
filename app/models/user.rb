class User < ApplicationRecord
  has_secure_password

  PASSWORD_REGEX = /\A[a-zA-Z0-9]*\z/.freeze
  PASSWORD_LENGTH = 8
  USERNAME_MIN_LENGTH = 3
  USERNAME_MAX_LENGTH = 50

  has_many :projects, dependent: :destroy

  validates :username, :password, :password_confirmation, presence: true
  validates :username, uniqueness: true, length: { minimum: USERNAME_MIN_LENGTH, maximum: USERNAME_MAX_LENGTH }
  validates :password, length: { is: PASSWORD_LENGTH }, confirmation: true
  validates :password, format: { with: PASSWORD_REGEX, message: I18n.t('models.user.password') }
end
