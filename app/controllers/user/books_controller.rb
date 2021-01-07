class User::BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @comment = Comment.new
  end

  def create
    book = Book.new(book_params)
    if book.save
      redirect_to user_book_path(book.id), notice: '素敵な本をありがとう。'
    else
      render :new, alert: 'ごめんなさい、上手く投稿できなかったみたい。'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update
      redirect_to user_book_path(book.id), notice: '正しい情報をありがとう。'
    else
      render :edit, alert: 'ごめんなさい、上手く編集できなかったみたい。'
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      redirect_to user_books_path, notice: 'もみ消しといたよ。'
    else
      render :show
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :digest, :image)
  end
end
