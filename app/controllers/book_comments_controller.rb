class BookCommentsController < ApplicationController
  def create
    @book_comment = current_user.book_comments.new(comment_params)
    if @book_comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @book_comment = BookComment.find_by(params[:id], user_id: current_user.id)
    @book_comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def comment_params
    params.require(:book_comment).permit(:content, :book_id)
  end
end
