class ShelterSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :phone_number
  has_many :pets
end
