class Api::V1::AuthorsController < ApplicationController
  def index
      render json: Author.all
  end

  def search
    query = params[:query]
    authors = Author.find_by_fullname(query).select("(name || ' ' || surname) as label, id::text as value")
    render json: authors
  end



  private

  def author_params
    params.require(:book).permit(:name, :surname)
  end

end
