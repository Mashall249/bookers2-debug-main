class BookCommentsController < ApplicationController

  def create
    @books = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = @books.id
    comment.save
  end
  
  def destroy
    @books = Book.find(params[:book_id])
    BookComment.find(params[:id]).destroy
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
