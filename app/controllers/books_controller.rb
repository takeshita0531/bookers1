class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end


  def new
    @book = Book.new
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book), notice: "Book was successfully created."
    else
      render 'books/index'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book), notice: "Book was successfully update."
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path, notice: "Book was successfully destroyde"
  end

  private
  # def book_params
  #   params.permit(:title, :body)
  # end

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
