class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: 'You have created book successfully.'
    else
      @books = Book.all
      render :index

    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @books = Book.all
    @book = Book.find(params[:id])
    @user = @book.user
    @book_new = Book.new
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book), notice: 'You have updated book successfully.'
    else
    flash.now[:danger] = 'It was an error.'
    render :edit
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user!= current_user
      redirect_to books_path
    end
  end


  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = 'Book was successfully destroyed.'
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:body, :title)
  end

end