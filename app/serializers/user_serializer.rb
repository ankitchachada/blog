class UserSerializer < ActiveModel::Serializer
  attributes :id,:username, :email, :name, :created_at, :updated_at

  def created_at
  	"Date: " + object.created_at.strftime("%m-%d-%Y" + " and Time: " + "%H:%M %Z")
  end

  def updated_at
  	"Date: " + object.updated_at.strftime("%m-%d-%Y" + " and Time: " + "%H:%M %Z")
  end
end
