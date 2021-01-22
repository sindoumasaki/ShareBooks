class User::CommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    @comment = book.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to user_book_url(book)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_books_url
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :user_id, :book_id)
  end
end