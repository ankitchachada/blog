class Api::V1::UsersController < Api::V1::BaseController

  before_action :set_user, only: [:show, :update, :destroy]
  
  def index
    @users = User.all.page(params[:page]).per(params[:limit])
	  render json: @users
  end

  def show
  	render json: @user
  end

  def update
  	authorize @user
  	@user.update(user_params)
  	render json: @user
  end

  def destroy
  	authorize @user
  	@user.destroy
  	render json: @user
  end

  private

  def user_params
    params.require(:user).permit(:username,:name)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def get_user
    if params[:user_id]
      User.find(params[:user_id])
    else
      current_user
    end
  end


end