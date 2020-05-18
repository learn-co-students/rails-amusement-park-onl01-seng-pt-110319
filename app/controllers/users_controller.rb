class UsersController < ApplicationController
  before_action :user_new, only: [:new, :login]


  def new
  end

  def create
    @user = User.create(user_params)
    session[:user_id]=@user.id
    redirect_to user_path(@user)
  end

  def show
    if @user ||= User.find_by(id: params[:id])
      @attractions = Attraction.all
      redirect_to root_path if session[:user_id] != @user.id
    else
      redirect_to root_path
    end
  end

  def login
  end

  private
    def user_params
      params.require(:user).permit(:name,:password,:height,:tickets,:nausea,:happiness,:admin)
    end

    def login_info
      params.require(:user).permit(:name,:password)
    end
    def user_new
      @user = User.new
    end

end
