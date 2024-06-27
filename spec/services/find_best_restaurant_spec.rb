require "rails_helper"

RSpec.describe FindBestRestaurant do
  it "does not repeat the same restaurant over three days" do
    location = Location.create!(name: "home")
    indian = Cuisine.create!(name: "indian")
    pizza = Cuisine.create!(name: "pizza")
    zaika = Restaurant.create!(name: "Zaika", location: location, cuisine: indian)
    zollhaus = Restaurant.create!(name: "Zollhaus Pankow", location: location, cuisine: pizza)

    Lunch.create!(restaurant: zaika, date: 2.days.ago)
    Lunch.create!(restaurant: zollhaus, date: 3.days.ago)

    result = FindBestRestaurant.new.call(location, Time.current)

    expect(result).to eq zollhaus
  end

  it "does not repeat the same cuisine over two days" do
    location = Location.create!(name: "home")
    indian = Cuisine.create!(name: "indian")
    pizza = Cuisine.create!(name: "pizza")
    zaika = Restaurant.create!(name: "Zaika", location: location, cuisine: indian)
    zollhaus = Restaurant.create!(name: "Zollhaus Pankow", location: location, cuisine: pizza)
    _itialian = Restaurant.create!(name: "Italian", location: location, cuisine: pizza)

    Lunch.create!(restaurant: zaika, date: 3.days.ago)
    Lunch.create!(restaurant: zollhaus, date: 1.day.ago)

    result = FindBestRestaurant.new.call(location, Time.current)

    expect(result).to eq zaika
  end

  it "works with missing data about pass lunches" do
    location = Location.create!(name: "home")
    indian = Cuisine.create!(name: "indian")
    pizza = Cuisine.create!(name: "pizza")
    zaika = Restaurant.create!(name: "Zaika", location: location, cuisine: indian)

    result = FindBestRestaurant.new.call(location, Time.current)

    expect(result).to eq zaika
  end

  it "does not suggest restaurants that are closed on the given day" do
    location = Location.create!(name: "home")
    vietnamese = Cuisine.create!(name: "vietnamese")
    imbiss = Restaurant.create!(name: "Imbiss", location: location, cuisine: vietnamese, closed_on: [6])

    result = FindBestRestaurant.new.call(location, Time.parse("2024-06-29"))

    expect(result).to eq nil
  end
end
