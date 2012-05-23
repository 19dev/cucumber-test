class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(params[:book])
    if @book.save
      redirect_to books_path
    end
  end

  def index
    @books = Book.all
  end
end
