class Api::V1::BooksController < ApplicationController
  def index
      render json: Book.all
  end

  def search
    query = params[:query]
    books = Book.where('title LIKE ? OR isbn LIKE ?', "%#{query}%", "%#{query}%")
    render json: books
  end

  # def qwe
  #   books = Book.search('heart')
  #   render json: books
  # end

  def create
    book = Book.new(book_params)
    if book.save
      render json: book
    else
      render nothing: true, status: :bad_request
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :isbn)
  end

end
