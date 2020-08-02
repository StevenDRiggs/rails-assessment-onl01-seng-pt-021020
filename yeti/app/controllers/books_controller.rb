class BooksController < ApplicationController

  # processing methods 

  protected

    def object_params
      params.require(:book).permit([:name, :synopsis])
    end

end
