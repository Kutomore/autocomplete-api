class BooksAutocompleteController < ApplicationController
  def index
    render json: Book.auto_complete(params[:q].to_s)
  end
end
