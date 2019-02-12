class User < ApplicationRecord
  has_secure_password

  PASSWORD_REGEX = /\A[a-zA-Z0-9]*\z/

  has_many :projects, dependent: :destroy

  validates :username, :password, :password_confirmation, presence: true
  valigates :username, uniqueness: true, length: { minimum: 3, maximum: 50 }
  validates :password, length: { is: 8 }, confirmation: true
  validates :password, format: { with: PASSWORD_REGEX, message: 'Only alphanumeric allowed' }
end
