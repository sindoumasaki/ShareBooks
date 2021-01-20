class Common::TopsController < ApplicationController
  def top
    @book_top3 = Book.book_top3
  end
end
