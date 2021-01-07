class Users::SessionsController < Devise::SessionsController
  # ワンタッチログイン
  def new_guest
    user = User.guest
    sign_in user
    redirect_to user_homes_home_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  # ゲストログイン（ポートフォリオ閲覧）
  def browsing
    user = User.employer
    sign_in user
    redirect_to user_homes_home_path, notice: 'ゲストユーザー（採用者様専用）でログインしました。'
  end
end