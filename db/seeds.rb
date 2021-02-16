# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'date'

User.destroy_all
Friend.destroy_all
Booking.destroy_all


puts 'Creating 5 fake users...'
5.times do

  user = User.new(
    first_name:   Faker::Name.unique.name,
    last_name:    Faker::Name.unique.name,
    email: Faker::Internet.email,
    age: rand(18..53),
    gender: Friend::GENDER.sample,
    city: Faker::Address.city,
    password: "Lorem ipsum"
    )
  user.save!


  10.times do

    friend = Friend.new(
      first_name:   Faker::Name.unique.name,
      last_name:    Faker::Name.unique.name,
      age: rand(18..53),
      gender: Friend::GENDER.sample,
      city: Faker::Address.city,
      price: rand(50..3500),
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec id odio sed tortor scelerisque sollicitudin a non lorem. Aliquam ultricies dolor a felis pharetra, vitae viverra sapien fermentum",
      user: user
    )
    friend.save!

  end
end

puts 'Finished!'
