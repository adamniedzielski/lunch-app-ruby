class DeactivationsController < ApplicationController
  def create
    restaurant = Restaurant.find(params.fetch(:restaurant_id))
    restaurant.deactivated_at = Time.current
    restaurant.save!

    redirect_to restaurants_url, notice: "Restaurant was successfully deactivated"
  end

  def destroy
    restaurant = Restaurant.find(params.fetch(:restaurant_id))
    restaurant.deactivated_at = nil
    restaurant.save!

    redirect_to restaurants_url, notice: "Restaurant was successfully activated"
  end
end
