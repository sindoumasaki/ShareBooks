class Comment < ApplicationRecord
  # アソシエーション============================================
  belongs_to :user
  belongs_to :book
  has_many :comment_favorites,    dependent: :destroy

  # バリデーション =============================================
  validates :comment,   presence: true
end