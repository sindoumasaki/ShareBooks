class User::UsersController < ApplicationController
  before_action :redirect_top, only: [:show, :my_page, :follows, :follower, :edit, :update]
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def my_page
    @user = User.find(params[:id])
    @books = @user.books
    @tags = @user.tags.name
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
    user = User.find(params[:id])
    if user.update(user_params)
      tags = Vision.get_image_data(user.user_image)
      tags.each do |tag|
        user.tags.create(name: tag, user_id: user.id)
      end
      redirect_to my_page_user_user_url(user), notice: '本登録完了'
    else
      redirect_to edit_user_user_url(user), alert: '登録できなかった'
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_image, :nickname, :user_introduction, :user_status)
  end
end