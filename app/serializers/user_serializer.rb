class UserSerializer < ActiveModel::Serializer
  attributes :id,:username, :email, :name, :created_at, :updated_at
end
