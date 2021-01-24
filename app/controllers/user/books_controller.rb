class User::BooksController < ApplicationController
  def new
    @book = Book.new
    @big_genres = BookBigGenre.all
  end

  def index
    @books = Book.page(params[:page]).per(10)
  end

  def show
    @book = Book.find(params[:id])
    @comment = Comment.new
    @comments = @book.comments
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to user_book_url(@book), notice: '素敵な本をありがとう。'
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
    params.require(:book).permit(:title, :digest, :book_image, :book_big_genre_id)
  end
end
