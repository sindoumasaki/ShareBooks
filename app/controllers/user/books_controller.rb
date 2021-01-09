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
    @book = Book.new(book_params)
    if @book.save
      redirect_to user_book_path(@book), notice: '素敵な本をありがとう。'
    else
      render :new, alert: 'ごめんなさい、上手く投稿できなかったみたい。'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to user_book_path(@book), notice: '更新ありがとう。'
    else
      render :edit, alert: 'ごめんなさい、上手く編集できなかったみたい。'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      redirect_to user_books_path, notice: 'もみ消しといたよ。'
    else
      render :show
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :digest, :book_image)
  end
end
