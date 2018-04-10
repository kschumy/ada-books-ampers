class BooksController < ApplicationController

  def index
    @user = User.find_by(id: session[:user_id])
    # If we are in a nested route (/authors/7/books), we don't want @books to be Book.all, we want @books to just be the author's books
    if params[:author_id]
      author = Author.find_by(id: params[:author_id])
      @books = author.books
    else
      # we don't need to find a specific author's books, we just need to list all books
      @books = Book.all

    end
  end

  def show
    id = params[:id]
    @book = Book.find(id)
  end

  def new
    @book = Book.new
    @book.author = Author.find(params[:author_id])
    @action = author_books_path(params[:author_id])
  end

  def create
    @book = Book.new(book_params)
    @book.author = Author.find(params[:author_id])
    if @book.save
      flash_success("saved") # flash[:success] = "#{@book.title} created"
      redirect_to root_path
    else
      flash.now[:alert] = @book.errors
      # flash.now = {}
      # @book.errors.each do |field, message|
      #   flash.now[:alert][field] = message
      # end
      render :new
    end
    # elsif @book
    #   flash_alert { "saved" } # flash[:alert] = "#{@book.title} failed to create"
    #   render :new
    # else
    #   # flash_does_not_exist # flash[:alert] = "Book not found"
    #   redirect_to root_path
    # end
  end

  def edit
    @book = Book.find_by(id: params[:id])
  end

  def update
    @book = Book.find_by(id: params[:id])
    if !@book
      flash_does_not_exist   # flash[:alert] = "Book not found"
      redirect_to books_path
    elsif @book.update(book_params)
      flash_success("updated") # flash[:success] = "#{@book.title} updated"
      redirect_to book_path(@book.id)
    else
      flash_alert("update") # flash[:alert] = "Book failed to update"
      render :edit
    end
  end

  def destroy
    id = params[:id]
    begin
      @book = Book.find(id)
      if @book
        @book.destroy
      end
      flash_success("deleted") # flash[:success] = "#{@book.title} deleted"
    rescue
      flash_does_not_exist # flash[:alert] = "Book does not exist"
    end
    redirect_to books_path
  end

  private

  def flash_success(message)
    flash[:success] = "#{@book.title} message"
  end

  def flash_alert(message)
    flash[:alert] = "#{@book.title} message"
  end

  def flash_does_not_exist
    flash[:alert] = "Book does not exist"
  end

  def book_params
    return params.require(:book).permit(:author_id, :description, :title, genre_ids: [])
  end









end
