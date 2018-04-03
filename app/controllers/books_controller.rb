class BooksController < ApplicationController

  def index
    @books = Book.first
  end

  def show
    id = params[:id]
    @book = Book.find(id)
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    if book.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @book = Book.find_by(id: params[:id])
  end

  def update
    @book = Book.find_by(id: params[:id])
    if !@book.nil?
      if @book.update(book_params)
        redirect_to book_path(@book.id)
      else
        render :edit
      end
    else
      redirect_to books_path
    end


  end

  def destroy
    id = params[:id]
    @book = Book.find(id)
    if @book
      @book.destroy
    end
    redirect_to books_path
  end

  private

  def book_params
    return params.require(:book).permit(:author, :description, :title)
  end
end
