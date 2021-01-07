class Book < ApplicationRecord
  # アソシエーション=================================================
  belongs_to :user
  has_many :comments,           dependent: :destroy
  has_many :book_favorites,     dependent: :destroy
  has_many :book_big_genres,    dependent: :destroy

  # バリデーション===================================================
  validates :title,   presence: true
  validates :digest,  presence: true

  # 画像投稿のための記述=============================================
  attachment :image
end
