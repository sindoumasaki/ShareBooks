class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ワンタッチログイン（毎回ゲスト作成）
  # 非常に低い可能性だが同じメールアドレスを作成してしまう可能性を孕んでいる(保存はしないけど)
  def self.guest
    string_4 = SecureRandom.hex(4)
    string_5 = SecureRandom.hex(5)
    # create!(nickname: 'ゲスト' + string_4) do |user|
    #   user.email = string_5 + '@' + string_4
    #   user.encrypted_password = SecureRandom.urlsafe_base64
    # end
    string_password = SecureRandom.urlsafe_base64
    create(nickname: 'ゲスト' + string_4, email: string_5 + '@' + string_4, password: string_password, password_confirmation: string_password)
  end

  # ポートフォリオ閲覧用(1つのアカウント使い回し)
  def self.employer
    find_or_create_by!(nickname: '採用担当者') do |user|
      user.email = 'employer@example.com'
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
