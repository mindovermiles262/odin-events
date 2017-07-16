# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'andy d', email: 'andy@example.com')

# Create 9 additional users
9.times do |u|
  name = Faker::HarryPotter.character
  email = "user-#{u}@example.com"
  User.create(name: name, email: email)
end 


# Create 0..2 Events for first 5 users
hosts = User.order(id: :DESC).take(5)
hosts.each do |host|
  rand(0..2).times do
    title = Faker::Coffee.blend_name
    description = Faker::Coffee.notes
    starts_at = Faker::Date.backward(60)
    host.hosted_events.build(title: title, description: description, starts_at: starts_at)
    host.save!
  end
end


guests = User.order(id: :DESC).take(5)
guests.each do |guest|
  Attendance.create(user_id: guest.id, event_id: 2)
end