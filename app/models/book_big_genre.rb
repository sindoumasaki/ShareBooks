class BookBigGenre < ApplicationRecord
  # アソシエーション====================================================
  belongs_to :book
  has_many :book_small_genres

  # バリデーション======================================================
  varidates :big_genre_name,    presence: true,   uniqueness: true
end
