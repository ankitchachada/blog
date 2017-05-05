class Api::V1::PostsController < Api::V1::BaseController
  
  #authenticated! #commented because token authentication is used now
  before_action :set_post, only: [:show, :update, :destroy]
  
  def index
    @posts = Post.all.page(params[:page]).per(params[:limit])
	  respond_with @posts
  end
	
  def create
	  post = current_user.posts.create(post_params)
	  render json: post
  end

  def show
	  render json: @post
  end

  def update
	  authorize @post
	  @post.update(post_params)
	  render json: @post
  end

  def destroy
	  authorize @post
	  @post.destroy
	  render json: @post
  end

private

  def post_params
    params.require(:post).permit(:user_id,:content)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def get_user
    if params[:user_id]
      User.find(params[:user_id])
    else
      current_user
    end
  end

end
