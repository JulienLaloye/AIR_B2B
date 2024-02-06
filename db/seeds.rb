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
    email: Faker::Internet.email,
    password: "1234567",
  )

  dj = Dj.new(
    name: Faker::Name.name,
    price_per_day: Faker::Number.within(range: 100..500),
    genre: ["Techno", "Electro", "Hiphop", "House", "EDM"].sample,
    location: Faker::Address.city,
    capacity: Faker::Number.within(range: 100..10000),
    description: Faker::Lorem.sentence,
    picture: Faker::LoremFlickr.image,
    user: user
  )
  user.save!
  dj.save!
end
