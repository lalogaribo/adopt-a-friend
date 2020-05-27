class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :address, :username, :email
  has_many :pets
end
