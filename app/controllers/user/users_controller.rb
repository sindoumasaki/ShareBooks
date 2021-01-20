class User::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def my_page
    @user = User.find(params[:id])
    @books = @user.books
  end

  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def follower
    user = User.find(params[:id])
    @users = user.followers
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to my_page_user_user_url(@user)
  end

  private
  def user_params
    params.require(:user).permit(:nickname,:user_introduction, :user_image, :user_status)
  end
end