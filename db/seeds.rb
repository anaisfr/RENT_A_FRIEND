# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'date'
require "open-uri"

User.destroy_all
Friend.destroy_all
Booking.destroy_all


puts 'Creating 5 fake users...'
users = []
5.times do
file = URI.open("https://i.pravatar.cc/300")
  user = User.new(
    first_name:   Faker::Name.first_name,
    last_name:    Faker::Name.last_name,
    email: Faker::Internet.email,
    age: rand(18..53),
    gender: Friend::GENDER.sample,
    city: Faker::Address.city,
    password: "Lorem ipsum"
    )
  user.photo.attach(io: file, filename: 'avatar.png', content_type: 'image/png')
  user.save!
  users << user
end

friends = []
10.times do
file = URI.open("https://i.pravatar.cc/300")
  friend = Friend.new(
    first_name:   Faker::Name.first_name,
    last_name:    Faker::Name.last_name,
    age: rand(18..53),
    gender: Friend::GENDER.sample,
    city: Faker::Address.city,
    price: rand(50..3500),
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec id odio sed tortor scelerisque sollicitudin a non lorem. Aliquam ultricies dolor a felis pharetra, vitae viverra sapien fermentum",
    user: users.sample
  )
  friend.photo.attach(io: file, filename: 'avatar.png', content_type: 'image/png')
  friend.save!
  friends << friend
end

10.times do
  booking = Booking.new(
    start_date: Date.today + 1,
    end_date: Date.today + 2,
    user: users.sample,
    friend: friends.sample
    )
  booking.save!
end


puts 'Finished!'
