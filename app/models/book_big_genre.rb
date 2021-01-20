class BookBigGenre < ApplicationRecord
  # アソシエーション====================================================
  has_many :books,              dependent: :destroy
  has_many :book_small_genres,  dependent: :destroy

  # バリデーション======================================================
  validates :big_genre_name,    presence: true,   uniqueness: true
end
