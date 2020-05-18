class AttractionsController < ApplicationController
before_action :logged_in?

  def index
      @attractions = Attraction.all
      @current_user ||= current_user
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def new
    @attraction=Attraction.new
  end

  def edit
    if @attraction = Attraction.find_by(id: params[:id])
    else
      redirect_to attractions_path
    end
  end


  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def show
    if @attraction = Attraction.find_by(id: params[:id])
      @current_user=current_user
    else
      redirect_to attractions_path
    end
  end

  private
  def logged_in?
    redirect_to root_path if !current_user
  end

    def attraction_params
      params.require(:attraction).permit(:name,:tickets,:min_height,:nausea_rating,:happiness_rating)
    end



end
