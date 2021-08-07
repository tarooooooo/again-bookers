class UsersController < ApplicationController
  before_action :baria_user, only: [:edit]
  
  def show
    @book = Book.new
    @user_book = Book.where(user_id:params[:id])
    @user = User.find(params[:id])
  end
  
  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice:"You have updated user successfully."
    else
      render"edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end
  
  def baria_user
    unless User.find(params[:id]).id == current_user.id
    # if User.find(params[:id]).id != current_user.id 
    redirect_to user_path(current_user)
    end
  end
end
