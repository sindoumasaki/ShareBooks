class Users::PasswardsController < Devise::PasswardsController
  before_action :check_employer, only: :create

  # 閲覧用ゲストユーザーのパスワード再設定メール送信を防ぐための記述
  def check_employer
    if params[:user][:email].downcase == 'employer@example.com'
      redirect_to user_homes_home_path, alert: '閲覧用ゲストユーザーの変更・削除はできません。'
    end
  end
end