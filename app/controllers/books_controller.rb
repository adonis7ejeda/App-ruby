class BooksController < ApplicationController
  before_action :set_book, only: [:edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @book.errors.full_messages, status: :unprocessable_entity }
        format.js {render :new}
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @book.errors.full_messages, status: :unprocessable_entity }
        format.js {render :new}
      end
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.json { head :no_content }
      format.js
    end
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:titulo, :autor, :anyo)
    end

end
