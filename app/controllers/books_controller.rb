class BooksController < ApplicationController
  before_action :baria_book , only: [:edit]

  def create
    @user = current_user
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save
        redirect_to book_path(@book.id), notice:'You have created book successfully.'
    else
       render"index"
    end
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
    @like = Like.new
  end

  def show
    @book = Book.new
    @user_book = Book.find(params[:id])
    @user = @user_book.user
    @like = Like.new
    @book_comments = @user_book.book_comments.all
    @book_comment = current_user.book_comments.new
  end

  def edit
    @book=Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id),notice:"You have updated book successfully."
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

   private

   def book_params
     params.require(:book).permit(:title,:body)
   end

   def baria_book
     unless Book.find(params[:id]).user_id == current_user.id
     Book.find(params[:id]).user_id =! current_user.id
     redirect_to books_path
     end
   end

end
