class Admin::HomesController < ApplicationController
  def home
    @new_users = User.new_users
    @new_books = Book.new_books
  end
end
