class Book < ApplicationRecord
  # アソシエーション=================================================
  belongs_to :user
  has_many :comments,           dependent: :destroy
  has_many :book_favorites,     dependent: :destroy
  has_many :book_big_genres,    dependent: :destroy

  # バリデーション===================================================
  varidates :title,   presence: true
  varidates :digest,  presence: true
end
