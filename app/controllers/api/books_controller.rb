module Api
  class BooksController < ApplicationController
    def index
        render json: Book.all
    end
  end
end
