class PostSerializer < ActiveModel::Serializer
  attributes :content, :user

  def user
  	object.user.username
  end
end
