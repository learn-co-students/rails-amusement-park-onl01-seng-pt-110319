class SessionsController < ApplicationController
  require 'pry'
  def create
    #binding.pry
    if @user = User.find_by(name: user_params[:name])
      if @user.authenticate(user_params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        wrong_info
      end
    else
      wrong_info
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  private
  def wrong_info
    flash[:message] = "Wrong Username or password"
    redirect_to signin_path
  end

  def user_params
    params.require(:user).permit(:name,:password)
  end


end
