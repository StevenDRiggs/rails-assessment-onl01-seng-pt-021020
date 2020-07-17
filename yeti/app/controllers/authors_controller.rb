class AuthorsController < ApplicationController
  protected
    def object_params
      params.require(:author).permit([:name])
    end
end
