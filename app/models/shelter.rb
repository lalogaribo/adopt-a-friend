class Shelter < ApplicationRecord
  has_many :pets, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :password, presence: true, length: {minimum: 5}
  has_secure_password
end
