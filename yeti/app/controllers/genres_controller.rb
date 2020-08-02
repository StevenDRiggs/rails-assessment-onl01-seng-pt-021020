class GenresController < ApplicationController

  # processing methods 

  protected

    def object_params
      params.require(:genre).permit([:name])
    end

end
