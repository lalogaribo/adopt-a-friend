class PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :breed, :animal_type, :is_adopted
  belongs_to :shelter
end
