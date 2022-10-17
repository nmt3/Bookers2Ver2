class UsersController < ApplicationController
  before_action :correct_user, only: [:edit]


  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end


  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end


  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to user_path(current_user) unless @user == current_user
    end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end


  def book_params
    params.require(:book).permit(:title, :body)
  end


end
