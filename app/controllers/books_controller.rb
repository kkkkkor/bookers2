class BooksController < ApplicationController
  def  top
  end

  def new
   @book_image = BookImage.new
  end

  def create
    @book_image = BookImage.new(book_image_params)
    @book_image.user_id = current_user.id
    @book_image.save
    redirect_to book_images_path
  end

  def index
  end

  def show
  end

  def destroy
  end


  private

  def book_image_params
    params.require(:book_image).permit(:shop_name, :image, :caption)
  end
end
