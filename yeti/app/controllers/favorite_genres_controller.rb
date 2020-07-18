class FavoriteGenresController < ApplicationController

  protected

  def object_params
    params.require(:favorite_genre).permit([:notes])
  end
end
