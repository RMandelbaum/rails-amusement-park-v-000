class AttractionsController < ApplicationController

  def show
    @attraction = Attraction.find(params[:id])
    @user = User.find(session[:user_id])
  end

  def index
    @attractions = Attraction.all
    @user = User.find(session[:user_id])
  end

  def new
    if current_user.admin
      @attraction = Attraction.new
    end
  end

  def create
      @attraction = Attraction.new(attraction_params)
      @attraction.save

      redirect_to attraction_path(@attraction)
    end

  def edit
    if current_user.admin
      @attraction = Attraction.find(params[:id])
    end
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)

    redirect_to attraction_path(@attraction)
end

private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end
