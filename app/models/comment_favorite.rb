class CommentFavorite < ApplicationRecord
  # アソシエーション==================================================
  belongs_to :user
  belongs_to :comment
end