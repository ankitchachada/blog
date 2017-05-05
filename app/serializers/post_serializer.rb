class PostSerializer < ActiveModel::Serializer
  attributes :id,:content, :user, :created_at, :updated_at

  def user
  	object.user.username
  end
end
