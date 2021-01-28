class Admin::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def index
    @guests = User.ゲストユーザー
    @users = User.本登録済みユーザー
  end

  def bad_index
  end

  def confirm
  end

  def bye_bye
  end
end
