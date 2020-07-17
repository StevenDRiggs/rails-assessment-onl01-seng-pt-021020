class BooksController < ApplicationController
  protected
    def object_params
      params.require(:book).permit([:title, :synopsis])
    end
end
