class User::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def my_page
    @user = User.find(current_user.id)
  end

  def follows

  end

  def follower
  end
end
