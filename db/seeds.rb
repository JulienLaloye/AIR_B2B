# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'date'

Review.destroy_all
Booking.destroy_all
Dj.delete_all
User.destroy_all

city = ["Berlin", "London", "Netherlands", "Paris", "Japan"]

6.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    location: city.sample,
    password: "1234567"
  )
  user.save!
end

user = User.new(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: "test@test.com",
  location: city.sample,
  password: "123456"
)
user.save

puts "Creating Djs"

categories = ["Techno", "Electro", "Hiphop", "House", "EDM"]
price_per_day = (200..1000).to_a
capacity = (100..500).to_a

djs_data = [
  { name: "Bicep", price_per_day: price_per_day.sample, genre: categories.sample, location: "Berlin", capacity: capacity.sample, description: "He has released work under his own name as well as under the pseudonyms.", picture: "dj1.jpeg", user: User.all[0]},
  { name: "Basto", price_per_day: price_per_day.sample, genre: categories.sample, location: "London", capacity: capacity.sample, description: "Disco and House Music DJ, remixer and music producer", picture: "dj2.jpeg", user: User.all[1]},
  { name: "Claptone", price_per_day: price_per_day.sample, genre: categories.sample, location: "Netherlands", capacity: capacity.sample, description: "Dutch house DJ and producer, who plays a mixture of techno, progressive and deep house styles", picture: "dj3.jpg", user: User.all[2]},
  { name: "DallasK", price_per_day: price_per_day.sample, genre: categories.sample, location: "Paris", capacity: capacity.sample, description: "Parisian DJ producer based in London, UK; noted for mixing techno, house, and drum and bass", picture: "dj4.png", user: User.all[3]},
  { name: "DJ Jurgen", price_per_day: price_per_day.sample, genre: categories.sample, location: "Japan", capacity: capacity.sample, description: "Grammy nominated Japanese producer / DJ", picture: "dj5.jpeg", user: User.all[4]},
  { name: "Mr Disrespekt", price_per_day: price_per_day.sample, genre: categories.sample, location: "Frankfurt", capacity: capacity.sample, description: "Top German DJ of all times, he is Germans' favourite!", picture: "dj6.jpg", user: User.all[5]}
]

djs_data.each do |attributes|
  @dj = Dj.create!(attributes)
  puts "Created #{@dj.name}"
end

puts "Finished!"

status = [0, 1]

Dj.all.each do |dj|
  6.times do
    booking = Booking.new(
      date_begin: Date.today,
      date_end: Date.today + 1.day,
      status: status.sample,
      dj: dj,
      user: User.where.not(id: dj.user.id).sample
    )
    booking.save!
  end
end
rating = Random.new
comment = ["Great guy!", "Nice Music!", "Cool", "It was so fun!", "Excellent music", "What a perfect night to have him!"]

Booking.all.each do |booking|
  10.times do
    review = Review.new(
      rating: rating.rand(5.0..10.0),
      comment: comment.sample,
      type_of_review: status.sample,
      booking: booking,
      user: booking.user
    )
    review.save!
  end
end
