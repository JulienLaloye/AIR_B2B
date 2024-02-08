# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Dj.destroy_all
User.destroy_all

5.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "1234567",
    profile_picture: Faker::LoremFlickr.image
  )
  user.save!
end

puts "Creating Djs"

categories = ["Techno", "Electro", "Hiphop", "House", "EDM"]
price_per_day = (200..1000).to_a
capacity = (100..500).to_a

djs_data = [
  { name: "Bicep", price_per_day: price_per_day.sample, genre: categories.sample, location: "Berlin", capacity: capacity.sample, description: "He has released work under his own name as well as under the pseudonyms.", picture: "../app/assets/images/dj1.webp", user: User.all[0]},
  { name: "Basto", price_per_day: price_per_day.sample, genre: categories.sample, location: "London", capacity: capacity.sample, description: "Disco and House Music DJ, remixer and music producer", picture: "../app/assets/images/dj2.jpeg", user: User.all[1]},
  { name: "Claptone", price_per_day: price_per_day.sample, genre: categories.sample, location: "Netherlands", capacity: capacity.sample, description: "Dutch house DJ and producer, who plays a mixture of techno, progressive and deep house styles", picture: "../app/assets/images/dj3.jpg", user: User.all[2]},
  { name: "DallasK", price_per_day: price_per_day.sample, genre: categories.sample, location: "Paris", capacity: capacity.sample, description: "Parisian DJ producer based in London, UK; noted for mixing techno, house, and drum and bass", picture: "../app/assets/images/dj4.png", user: User.all[3]},
  { name: "DJ Jurgen",price_per_day: price_per_day.sample, genre: categories.sample, location: "Japan", capacity: capacity.sample, description: "Grammy nominated Japanese producer / DJ", picture: "../app/assets/images/dj5.jpeg", user: User.all[4]},
]

djs_data.each do |attributes|
  dj = Dj.create!(attributes)
  puts "Created #{dj.name}"
end

puts "Finished!"
