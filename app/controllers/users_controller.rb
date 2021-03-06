class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  	@user = User.find(params[:id])
  	@books = Book.where(user_id: @user.id)
  	@book = Book.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		flash[:notice] = "プロフィールを更新しました"
  	else
  		flash[:alert] = "プロフィールの更新に失敗しました"
  	end
  	redirect_to user_path
  end

  def allusers
    @users = User.all
    @user = User.find(current_user.id)
    @book = Book.new()
  end

  private
  def user_params
  	params.require(:user).permit(:name, :body, :profile_image)
  end
end
