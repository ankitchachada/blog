class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def update?
    is_user?
  end

  def destroy?
    is_user?
  end

  def is_user?
    @post.user == @user
  end

end