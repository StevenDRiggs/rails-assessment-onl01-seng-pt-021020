class UsersController < ApplicationController
  protected
    def object_params
      params.require(:user).permit([:name, :email, :password])
    end
end
