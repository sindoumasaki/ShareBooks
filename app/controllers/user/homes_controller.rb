class User::HomesController < ApplicationController
  def home
    @book_top10 = Book.book_top10
  end
end
