class SessionsController < ApplicationController
    skip_before_action :login_required, :only=> [:new]
    def new
        @user = User.new
    end
    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash.now[:alert] = "Email or Password is INVALID"
            redirect_to 'new'
        end
    end
    def destory
        session[:user_id] = nil
        redirect_to root_path
    end

end