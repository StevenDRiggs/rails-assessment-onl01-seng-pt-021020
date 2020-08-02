class AuthorsController < ApplicationController

  # processing methods 

  protected

    def object_params
      params.require(:author).permit([:name])
    end

end
