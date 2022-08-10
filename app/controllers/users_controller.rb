class UsersController < ApplicationController

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
       render :edit
    else
       redirect_to user_path(current_user)
    end
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def update
    @user = current_user

  if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
  else
    @user = current_user
    render action: :edit
  end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'Welcome! You have signed up successfully.'
      redirect_to user_path(@user.id)
    else
      render :index
    end
  end

  def destroy
    @user = current_user
    if @user.destroy
      flash[:notice] = "Signed out successfully."
      redirect_to root_path
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end