class FindBestRestaurant
  def call(location, date)
    available_restaurants = location.restaurants.to_a

    last_lunches = Lunch.where(date: date - 2.days .. date).order(:date)
    last_cuisine = last_lunches.last&.restaurant&.cuisine
    (available_restaurants - last_lunches.map(&:restaurant)).reject do |restaurant|
      restaurant.cuisine == last_cuisine
    end.sample
  end
end
