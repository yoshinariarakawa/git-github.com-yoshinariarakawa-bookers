class BooksController < ApplicationController
  def new
   @book = Book.top
  end

  def create
   book = Book.new(book_params)
   book.save
   flash[:notice] = "Creating successfully"
   redirect_to books_path
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book= Book.find(params[:id])
  end

  def update
  flash[:notice] = "Updating successfully"
   redirect_to books_path
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy  # データ（レコード）を削除
    redirect_to books_path  # 投稿一覧画面へリダイレクト

  end

  private
  def book_params
   params.require(:book).permit(:title, :body)
  end
end
