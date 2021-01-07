class Users::RegistrationsController < Devise::RegistrationsController
  before_action :check_employer, only: %i[update destroy]

  # 閲覧用ゲストユーザーの編集・削除を防ぐための記述
  def check_employer
    if resouce.email == 'employer@example.com'
      redirect_to user_homes_home_path
    end
  end
end