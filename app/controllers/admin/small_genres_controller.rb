class Admin::SmallGenresController < ApplicationController
  def create
    big_genre = BookBigGenre.find_by(params[:book_big_genre_id])
    small_genre = big_genre.book_small_genres.build(small_genre_params)
    small_genre.save
    # big_genre_id = params[:book_big_genre_id]
    # small_genre = BookSmallGenre.new(small_genre_params)
    # small_genre.book_big_genre_id = big_genre_id
    # small_genre.save
    redirect_to admin_genres_url
  end

  def destroy
    small_genre = BookSmallGenre.find(params[:id])
    small_genre.destroy
  end

  private
  def small_genre_params
    params.require(:book_small_genre).permit(:small_genre_name, :book_big_genre_id)
  end
end