class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    # @books = Book.all
  #   @filterrific = initialize_filterrific(
  #     Author,
  #     params[:filterrific]
  #   ) or return
  #     @authors = @filterrific.find.page(params[:page])
   #
  #  respond_to do |format|
  #    format.html
  #    format.js
  #  end
   #
  #  rescue ActiveRecord::RecordNotFound => e
  #    # There is an issue with the persisted param_set. Reset it.
  #    puts "Had to reset filterrific params: #{ e.message }"
  #    redirect_to(reset_filterrific_url(format: :html)) and return
  #  end
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
    @author_books = @book.author_books.build
    @author = @author_books.build_author
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
    # @author_books = @book.author_books.

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.fetch(:book, {}).permit(:isbn, :title, author_attributes: [:name, :surname])
    end
end
