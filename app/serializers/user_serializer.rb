class UserSerializer < ActiveModel::Serializer
  attributes :username, :email, :name
end
