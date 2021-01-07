class BookSmallGenre < ApplicationRecord
  # アソシエーション=======================================================
  belongs_to :book_big_genre

  # バリデーション=========================================================
  validates :small_genre_name,    presence: true,   uniqueness: true
end