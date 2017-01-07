module Api
  class BooksController < ApplicationController
    def index
        render json: Book.all
    end
    def search
      query = params[:query]
      books = Book.where('title LIKE ? OR isbn LIKE ?',
                          "%#{query}%", "%#{query}%")
      render json: books
  end
  end
end
