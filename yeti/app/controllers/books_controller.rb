class BooksController < ApplicationController
  protected
    def object_params
      params.require(:book).permit([:name, :synopsis])
    end
end
