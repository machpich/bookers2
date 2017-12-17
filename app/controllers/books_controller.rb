class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def create
  	@book = Book.new(book_params)
    @book.user_id = current_user.id
  	if @book.save
      flash[:notice] = "投稿しました";
    else
      flash[:notice] = "投稿に失敗しました"
    end
  	redirect_to books_path
  end

  def show
  	@book = Book.find(params[:id])
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def destroy
  	@book = Book.find(params[:id])
  	if @book.destroy
      flash[:notice] = "削除しました"
    else
      flash[:notice] = "削除に失敗しました"
    end
  	redirect_to books_path
  end

  def update
  	@book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "編集しました"
    else
      flash[:notice] = "編集に失敗しました"
    end
  	redirect_to book_path(@book)
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end

end
