class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 5 }
end
