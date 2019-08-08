# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'cleaning database'
Restaurant.destroy_all

puts 'creating restaurants...'

restaurant_parameters = []

10.times do
  seed_resto = {
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    category: ['chinese', 'italian', 'japanese', 'french', 'belgian'].sample,
    phone_number: Faker::PhoneNumber.phone_number
  }

  restaurant_parameters << seed_resto
end

restaurants = Restaurant.create(restaurant_parameters)

puts 'finished restaurants...'

puts 'creating reviews...'

review_parameters = []

50.times do
  seed_review = {
    content: Faker::TvShows::HowIMetYourMother.quote,
    rating: [0, 1, 2, 3, 4, 5].sample,
    restaurant_id: restaurants.sample.id
  }
  review_parameters << seed_review
end

Review.create(review_parameters)

puts 'finished reviews...'
