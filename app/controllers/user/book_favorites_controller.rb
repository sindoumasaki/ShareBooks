class User::BookFavoritesController < ApplicationController
  def create
    # book = Book.find(params[:book_id])
    # favorites = book.favorites.new
    # favorites.user_id = current_user
    user = current_user
    book = Book.find(params[:book_id])
    favorite = BookFavorite.create(user_id: user.id, book_id: book.id)
  end

  def destroy
    user = current_user
    book = Book.find(params[:book_id])
    favorite = BookFavorite.find_by(user_id: user.id, book_id: book.id)
    favorite.destroy
  end
end