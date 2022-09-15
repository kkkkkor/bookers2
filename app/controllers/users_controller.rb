  class UsersController < ApplicationController
    before_action :book_user, only: [:edit, :update]
    def top

    end

    def edit
      @users = User.all
      @user = User.find(params[:id])



    end

    def index
      @user = current_user
      @users = User.all
      @book = Book.new
    end

    def update
      @users = User.all
      @user = User.find(params[:id])
     if @user.update(user_params)
       redirect_to user_path(@user), notice: 'You have updated user successfully.'
     else
       render :edit
     end
    end

   def show
      @user = User.find(params[:id])
      @books = @user.books
      @book = Book.new

    # if @user.update(user_params)
    #   redirect_to group_messages_path(@user), notice: 'You have created book successfully.'
    # else
    #   flash.now[:alert] = 'error'
    #   render :index
    # end
   end

  def create
     @user = @user.save(user_params)
     if @user.save
       redirect_to user_path(@user), notice: 'Signed in successfully'
     else
       flash.now[:alert] = "error メッセージを入力してください"
       render :index
     end

  end

  private

    def user_params
      params.require(:user).permit(:profile_image, :name, :introduction, :title, :body)
    end


    def book_user
     @user = User.find(params[:id])
     unless @user == current_user
     redirect_to user_path(current_user)
     end
    end
  end
