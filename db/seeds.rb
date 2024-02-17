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
Dj.destroy_all
User.destroy_all

city = ["Berlin", "London", "Amsterdam", "Paris", "Tokyo"]

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
  { name: "Bicep", price_per_day: price_per_day.sample, genre: categories.sample, location: "Berlin", capacity: capacity.sample, description: "He has released work under his own name as well as under the pseudonyms.", picture: "dj1.png", user: User.all[0]},
  { name: "Basto", price_per_day: price_per_day.sample, genre: categories.sample, location: "London", capacity: capacity.sample, description: "Disco and House Music DJ, remixer and music producer", picture: "dj2.png", user: User.all[1]},
  { name: "Claptone", price_per_day: price_per_day.sample, genre: categories.sample, location: "Netherlands", capacity: capacity.sample, description: "Dutch house DJ and producer, who plays a mixture of techno, progressive and deep house styles", picture: "dj3.png", user: User.all[2]},
  { name: "DallasK", price_per_day: price_per_day.sample, genre: categories.sample, location: "Paris", capacity: capacity.sample, description: "Parisian DJ producer based in London, UK; noted for mixing techno, house, and drum and bass", picture: "dj4.png", user: User.all[3]},
  { name: "DJ Jurgen", price_per_day: price_per_day.sample, genre: categories.sample, location: "Japan", capacity: capacity.sample, description: "Grammy nominated Japanese producer / DJ", picture: "dj5.png", user: User.all[4]},
  { name: "Mr Disrespekt", price_per_day: price_per_day.sample, genre: categories.sample, location: "Frankfurt", capacity: capacity.sample, description: "Top German DJ of all times, he is Germans' favourite!", picture: "dj6.png", user: User.all[5]}
]

djs_data.each do |attributes|
  @dj = Dj.create!(attributes)
  puts "Created #{@dj.name}"
end

puts "Finished!"

numbers = (1...365).to_a
numbers_booking = (1...10).to_a
Dj.all.each do |dj|
  date = Date.today + numbers.sample.day
  6.times do
    date += numbers.sample.day
    booking = Booking.new(
      date_begin: date,
      date_end: date + numbers_booking.sample.day,
      #0 for pending, 1 for accepted, 2 for declined, 3 for cancelled
      dj: dj,
      user: User.where.not(id: dj.user.id).sample
    )
    booking.save!
  end
end
comment = ["Great guy!", "Nice Music!", "Cool", "It was so fun!", "Excellent music", "What a perfect night to have him!"]

Booking.all.each do |booking|
  review = Review.new(
      rating: (0...5).to_a.sample,
      comment: comment.sample,
      type_of_review: 0, #0 means that the review was emited by the user that booked the dj
      booking: booking,
      user: booking.user
    )
  review_dj = Review.new(
      rating: (0...5).to_a.sample,
      comment: comment.sample,
      type_of_review: 1, #1 means that the review was emited by the user managing the DJ
      booking: booking,
      user: booking.dj.user
    )
  review.save!
  review_dj.save!
end
