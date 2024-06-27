class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to restaurants_url, notice: "Restaurant was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update(restaurant_params)
      redirect_to restaurants_url, notice: "Restaurant was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    Restaurant.find(params[:id]).destroy
    redirect_to restaurants_url, notice: "Restaurant was successfully removed"
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :location_id, :cuisine_id, closed_on: [])
  end
end
