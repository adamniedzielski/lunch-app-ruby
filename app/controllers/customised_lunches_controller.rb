class CustomisedLunchesController < ApplicationController
  def new
    @location = Location.find(params.fetch(:location_id))
    @restaurants = @location.restaurants
    @lunch = Lunch.new
  end
end
