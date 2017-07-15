# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'andy d', email: 'andy@example.com')

25.times do |u|
  name = Faker::GameOfThrones.character
  email = "user-#{u}@example.com"
  User.create(name: name, email: email)
end 

users = User.order(:created_at).take(10)
users.each do |e|
  rand(0..2).times do
    title = Faker::Coffee.blend_name
    description = Faker::Coffee.notes
    starts_at = Faker::Date.backward(60)
    e.events.build(title: title, description: description, starts_at: starts_at)
    e.save!
  end
end