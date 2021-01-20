class Admin::GenresController < ApplicationController
  def index
    @big_genre = BookBigGenre.new
    @big_genres = BookBigGenre.all
    @small_genre = BookSmallGenre.new
    @small_genres = BookSmallGenre.all
  end
end
