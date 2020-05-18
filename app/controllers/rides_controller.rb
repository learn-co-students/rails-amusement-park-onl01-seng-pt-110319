class RidesController < ApplicationController

    def new
      #binding.pry
      ride=Ride.new(:user_id => current_user.id, :attraction_id => params[:id])
      flash[:message] = ride.take_ride
      redirect_to user_path(current_user)
    end

end
