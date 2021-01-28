class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :user_status])
  end
  private
  # devise関連===============================================
  # サインアップ後のリダイレクト先を各homeページに遷移
  def after_sign_up_path_for(resource)
    case resource
    when Admin
      admin_homes_home_path
    when User
      user_homes_home_path
    end
  end
  # ログイン後のリダイレクト先を各homeページに遷移
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_homes_home_url
    when User
      user_homes_home_url
    end
  end
  # ログアウト 後のリダイレクト先を各homeページに遷移
  def after_sign_out_path_for(resource)
    root_url
  end

  # ログインしていない時topページにリダイレクトさせる
  def redirect_top
    redirect_to root_url, alert: 'ログインしてください。' unless user_signed_in? || admin_signed_in?
  end
end