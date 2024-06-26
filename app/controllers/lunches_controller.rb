class LunchesController < ApplicationController
  def new
    @location = Location.find(params.fetch(:location_id))
    @restaurant = @location.restaurants.sample
    @lunch = Lunch.new
  end

  def create
    lunch = Lunch.new(lunch_params)
    lunch.date = Time.current
    lunch.save!
    redirect_to root_url, notice: "Enjoy your meal!"
  end

  private

  def lunch_params
    params.require(:lunch).permit(:restaurant_id)
  end
end
