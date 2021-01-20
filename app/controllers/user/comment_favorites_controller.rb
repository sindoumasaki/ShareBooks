class User::CommentFavoritesController < ApplicationController
  def create
    user = current_user
    comment = Comment.find(params[:comment_id])
    favorite = CommentFavorite.create(user_id: user.id, comment_id: comment.id)
  end

  def destroy
    user = current_user
    comment = Comment.find(params[:comment_id])
    favorite = CommentFavorite.find_by(user_id: user.id, comment_id: comment.id)
    favorite.destroy
  end
end