class BookFavorite < ApplicationRecord
  # アソシエーション==========================================
  belongs_to :user
  belongs_to :book
end
