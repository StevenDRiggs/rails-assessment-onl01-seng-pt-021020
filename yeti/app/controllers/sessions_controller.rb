class SessionsController < ApplicationController
  def new
    render 'login'
  end

  def do_login
    @user = User.find_by(name: params[:name_or_email])
    if @user.nil?
      @user = User.find_by(email: params[:name_or_email])
    end

    if @user.nil?
      flash[:errors] = ['User not found']
      redirect_to login_path
    elsif @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:errors] = ['Password incorrect']
      redirect_to login_path
    end
  end

  def logout
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
