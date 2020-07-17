class GenresController < ApplicationController
  protected
    def object_params
      params.require(:genre).permit([:name])
    end
end
