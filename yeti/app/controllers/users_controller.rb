class UsersController < ApplicationController
  before_action :admin_or_self_required, only: [:edit, :update] do
    define_variables
  end
  before_action :admin_required, only: [:index, :delete, :destroy] do
    define_variables
  end


  def create
    @object_ = @obj.new(self.object_params)
    if @object_.save
      session[:user_id] = @object_.id
      redirect_to @object_
    else
      flash[:errors] = @object_.errors.full_messages
      render :new
    end
  end


  protected
    def object_params
      params.require(:user).permit([:name, :email, :password])
    end
end
