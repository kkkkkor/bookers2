class BooksController < ApplicationController
  def  top
  end

  def new
   @book = Book.new
  end

  def create
    @book = Book.new(book_image_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to user_path
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.show
  end

  def destroy
  end


  private

  def book_params
    params.require(:book_image).permit(:shop_name, :image, :caption)
  end
end
