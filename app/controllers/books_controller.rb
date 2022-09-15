class BooksController < ApplicationController
  def  top
  end

  def new
   @book = Book.new
  # @book_image = Book_Image.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def update
    @books = Book.all
     @book = Book.find(params[:id])
     if @book.update(book_params)
       redirect_to book_path(@book), notice: 'You have updated book successfully'
     else
       flash.now[:alert] = "error メッセージを入力してください"
       render :index
     end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.all
    @user = @book.user

  end

  def edit
    @book = Book.find(params[:id])
      @user = @book.user
      unless @user == current_user
     redirect_to(books_path)
      end
  end


  def create
     @books = Book.all
     @book = Book.new(book_params)
     @book.user_id = current_user.id
     if @book.save
       redirect_to book_path(@book.id), notice: 'You have created book successfully.'
     else
       render :index
     end
  end



  def destroy
  book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end


  private

  def book_params
    params.require(:book).permit(:title, :body, :profile_image, :name, :introduction)

  end
end
