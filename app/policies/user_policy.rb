class UserPolicy
  attr_reader :user, :user_object

  def initialize(user, user_object)
    @current_user = user
    @user = user_object
  end

  def update?
    @current_user == @user
  end

  def destroy?
  	@current_user == @user
  end

end