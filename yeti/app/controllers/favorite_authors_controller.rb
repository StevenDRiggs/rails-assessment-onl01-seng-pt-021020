class FavoriteAuthorsController < ApplicationController
  def update
    begin
      FavoriteAuthor.find(params[:id]).update(object_params)

    rescue ActiveRecord::FileNotFound
      flash[:errors] = ['Something went wrong...']
    end

    redirect_to users_path
  end

  protected

  def object_params
    params.require(:favorite_author).permit([:notes])
  end
end
