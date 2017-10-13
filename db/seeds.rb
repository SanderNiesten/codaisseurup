# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.destroy_all
Photo.destroy_all
Event.destroy_all
User.destroy_all
Profile.destroy_all

arno = User.create(email: "arno@codaisseurup.com", password: "abcd1234")
lara = User.create(email: "lara@codaisseurup.com", password: "abcde12345")

event_1 = Event.create(name: "Surprise Party", description: "Surprise for my biggest friend", location: "Amsterdam", includes_food: false, includes_drinks: true, price: 5.00, starts_at: 10.days.from_now, ends_at: 12.days.from_now, capacity: 100, active: true,  user: arno)

event_2 = Event.create(name: "Party", description: "An awesome party", location: "Amsterdam", includes_food: false, includes_drinks: true, price: 10.00, starts_at: 11.days.from_now, ends_at: 12.days.from_now, capacity: 50, active: true,  user: arno)


[
  { name: "Sports" },
  { name: "Outdoors" },
  { name: "Friends" },
  { name: "Family" },
  { name: "Study" },
].each do |category|
  Category.create!(category)
end

photo1 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dvukrvufi/image/upload/v1507801278/concert_yusa2u.jpg", event: event_1)
photo2 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dvukrvufi/image/upload/v1507801278/wedding_yexkd0.jpg", event: event_2)

Registration.create([
  { event: event, user: arno, price: event.price, total: event.total,  guests_count: 1 },
  { event: event, user: lara, price: event.price, total: event.total, guests_count: 3 },
])

puts "#{User.count} users created"
puts "#{Event.count} events created"
puts "#{Category.count} categories created"
