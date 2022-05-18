# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do
  restaurant = Restaurant.new(
    name: Faker::Movies::HitchhikersGuideToTheGalaxy.character,
    address: Faker::Movies::HitchhikersGuideToTheGalaxy.location,
    phone_number: Faker::PhoneNumber.cell_phone_in_e164,
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample
  )
  restaurant.save!

  review = Review.new(
    rating: Faker::Number.between(from: 1, to: 5),
    content: Faker::Movies::HitchhikersGuideToTheGalaxy.specie
  )
  review.restaurant = restaurant
  review.save!
end
