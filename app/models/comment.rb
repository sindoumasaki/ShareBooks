class Comment < ApplicationRecord
  # アソシエーション============================================
  belongs_to :user
  belongs_to :book
  has_many :comment_favorites,    dependent: :destroy

  # バリデーション =============================================
  validates :comment,   presence: true

  # 引数のuserがいいねしているかどうか確認するメソッド==========
  def comment_favorited_by?(user)
    comment_favorites.where(user_id: user.id).exists?
  end
end