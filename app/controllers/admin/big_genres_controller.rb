class Admin::BigGenresController < ApplicationController
  def create
    big_genre = BookBigGenre.new(big_genre_params)
    big_genre.save
    redirect_to admin_genres_url
  end

  def destroy
    big_genre = BookBigGenre.find(params[:id])
    big_genre.destroy
    redirect_to admin_genres_url
  end

  private
  def big_genre_params
    params.require(:book_big_genre).permit(:big_genre_name, :book_id)
  end
end