class UsersController < ApplicationController
  before_action :authentication_check, only: [:show]
  
  def home
  end

  def new 
    @user = User.new 
  end 

  def create 
    @user = User.create(user_params)

    if @user.save 
      session[:user_id] = @user.id 
      redirect_to user_path(@user)
    else 
      render 'new'
    end 

  end 

  def show 
    @user = User.find_by(:id => params[:id])
  end 
  
  def update
    @ride = Ride.new(:user_id => current_user.id, :attraction_id => params[:attraction_id])
    redirect_to user_path(current_user), :notice => @ride.take_ride
  end



  private

  def user_params 
    params.require(:user).permit(:name, :password, :height, :nausea, :happiness, :tickets, :admin)
  end 
end