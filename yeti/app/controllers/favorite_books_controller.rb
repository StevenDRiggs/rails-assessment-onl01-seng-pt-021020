class FavoriteBooksController < ApplicationController
  
  protected

  def object_params
    params.require(:favorite_book).permit([:notes])
  end
end
