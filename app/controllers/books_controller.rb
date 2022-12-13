class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def create
    @book_new = Book.new(book_params)
    @user = current_user
    @book_new.user_id = current_user.id

    if @book_new.save
    redirect_to book_path(@book_new.id)
    flash[:notice] = 'You have created book successfully.'
    else
      @books = Book.all
    render :index
    end
  end

  def index
    @books = Book.all
    @book_new = Book.new
    @user = current_user

  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

   def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      redirect_to book_path
      flash[:notice] = 'You have updated book successfully.'
    else
      render :edit
    end
   end


  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

    def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    unless @user == current_user
    redirect_to books_path
    end
    end



end
