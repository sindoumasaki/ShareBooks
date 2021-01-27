# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  before_action :check_employer, only: :create

  # 閲覧用ゲストユーザーのパスワード再設定メール送信を防ぐための記述
  def check_employer
    if params[:user][:email].downcase == 'employer@example.com'
      redirect_to user_homes_home_path, alert: '閲覧用ゲストユーザーの変更・削除はできません。'
    end
  end
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  # def update
  #   super
  # end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
