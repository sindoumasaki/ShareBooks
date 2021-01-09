class ApplicationController < ActionController::Base

  private
  # devise関連===============================================
  # サインアップ後のリダイレクト先を各homeページに遷移
  def after_sign_up_path_for(resource)
    if resource == :admin
      admin_homes_home_path
    else
      user_homes_home_path
    end
  end
  # ログイン後のリダイレクト先を各homeページに遷移
  def after_sign_in_path_for(resource)
    if resource == :admin
      admin_homes_home_path
    else
      user_homes_home_path
    end
  end
  # ログアウト 後のリダイレクト先を各homeページに遷移
  def after_sign_out_path_for(resource)
    root_path
  end
end