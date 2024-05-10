# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# db/seeds.rb

# db/seeds.rb

# Create users
user1 = User.create!(email: 'user1@example.com', password: 'password')
user2 = User.create!(email: 'user2@example.com', password: 'password')

# Create hotels
hotel1 = Hotel.create!(name: 'Hotel A', address: '123 Main St', total_rooms: 50, rooms_left: 50)
hotel2 = Hotel.create!(name: 'Hotel B', address: '456 Elm St', total_rooms: 75, rooms_left: 75)

# Create rooms
room1 = hotel1.rooms.create!(room_number: 101, room_type: 'Standard', capacity: 2, price: 100.00)
room2 = hotel1.rooms.create!(room_number: 102, room_type: 'Deluxe', capacity: 4, price: 150.00)
room3 = hotel2.rooms.create!(room_number: 201, room_type: 'Suite', capacity: 3, price: 200.00)
room4 = hotel2.rooms.create!(room_number: 202, room_type: 'Standard', capacity: 2, price: 100.00)

# Create bookings
Booking.create!(user: user1, room: room1, check_in: Date.today, check_out: Date.today + 3.days, guests: 2, status: 'upcoming')
Booking.create!(user: user2, room: room3, check_in: Date.today + 1.day, check_out: Date.today + 5.days, guests: 3, status: 'upcoming')

# Create reviews
Review.create!(user: user1, hotel: hotel1, rating: 4)
Review.create!(user: user2, hotel: hotel2, rating: 5)

puts 'Seed data generated successfully.'
