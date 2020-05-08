class AttractionsController < ApplicationController
include UsersHelper
	def index 
		@attractions = Attraction.all
		@user = User.find_by(id: session[:user_id])
	end 

	def show 
		@attraction = Attraction.find_by(id: params[:id])
		if logged_in? 
			@user = User.find_by(id: session[:user_id])
		end
	end

	def new
		@user = User.find_by(id: session[:user_id])
		if @user.admin == true
		end
	end

	def create 
		@attraction = Attraction.new(attraction_params)
		@attraction.save
		redirect_to attraction_path(@attraction)
	end

	def edit 
		@attraction = Attraction.find_by(id: params[:id])
		@user = User.find_by(id: session[:user_id])
		if @user.admin == true
		end
	end

	def update
		@attraction = Attraction.find_by(id: params[:id])
		@attraction.name = params[:attraction][:name]
		@attraction.save
		redirect_to attraction_path(@attraction)
	end


	private 

	def attraction_params
		params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
	end
		
end
