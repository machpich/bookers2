class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @books = Book.all
    @book = Book.new
    @user = User.find(current_user.id)
  end

  def create
  	@book = Book.new(book_params)
    @book.user_id = current_user.id
  	if @book.save
      flash[:notice] = "投稿しました";
      redirect_to user_path(@book.user_id)
    else
      flash[:alert] = "投稿に失敗しました"
    end
  end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
    @author = User.find(@book.user_id)
  end

  def edit
  	@book = Book.find(params[:id])
    @newbook = Book.new
    @user = User.find(current_user.id)
  end

  def destroy
  	@book = Book.find(params[:id])
  	if @book.destroy
      flash[:notice] = "削除しました"
    else
      flash[:alert] = "削除に失敗しました"
    end
  	redirect_to books_path
  end

  def update
  	@book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "編集しました"
      redirect_to books_path
    else
      flash[:alert] = "編集に失敗しました"
      redirect_to books_path
    end
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end

end
