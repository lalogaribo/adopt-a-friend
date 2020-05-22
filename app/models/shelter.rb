class Shelter < ApplicationRecord
  has_many :pets, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
  validates :phone_number, presence: true
end
