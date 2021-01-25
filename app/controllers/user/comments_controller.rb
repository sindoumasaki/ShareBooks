class User::CommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    @comments = Comment.all
  end

  def destroy
    @comments = Comment.all
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :user_id, :book_id)
  end
end