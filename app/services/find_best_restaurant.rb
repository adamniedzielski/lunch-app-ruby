class FindBestRestaurant
  def call(location, date)
    available_restaurants = open_restaurants(location, date)

    last_lunches = Lunch.where(date: date - 2.days .. date).order(:date)
    last_cuisine = last_lunches.last&.restaurant&.cuisine
    (available_restaurants - last_lunches.map(&:restaurant)).reject do |restaurant|
      restaurant.cuisine == last_cuisine
    end.sample
  end

  def open_restaurants(location, date)
    location.restaurants.reject do |restaurant|
      restaurant.closed_on.include?(date.wday)
    end
  end
end
