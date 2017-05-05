class PostSerializer < ActiveModel::Serializer
  attributes :id,:content, :user, :created_at, :updated_at

  def user
  	object.user.username
  end

  def created_at
  	"Date: " + object.created_at.strftime("%m-%d-%Y" + " and Time: " + "%H:%M %Z")
  end

  def updated_at
  	"Date: " + object.updated_at.strftime("%m-%d-%Y" + " and Time: " + "%H:%M %Z")
  end
end
