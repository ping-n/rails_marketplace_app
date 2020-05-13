require_relative 'data/data'

#Cleaning up Data-base
p "--" * 17
puts 'Destroying all existing data-base 🚨 🚨 🚨 '
Listing.destroy_all
User.destroy_all
Category.destroy_all
puts 'Data-base destroyed ✅'
p "--" * 17
puts 'Seeding Users'
user = User.create(email: 'admin@mail.com', password: 'password', role: 1)
puts "Created User 1"
user2 = User.create(email: 'p@mail.com', password: 'password')
puts "Created User 2"
user2 = User.create(email: 'h@mail.com', password: 'password')
puts "Created User 3"
puts 'Successfully Seeded Users ✅'
p "--" * 17
puts 'Seeding Categories'
categories.each do |category|
  cat = Category.create(category)
  puts "created #{cat[:name]} category"
end
puts 'Successfully Seeded Categories ✅'
p "--" * 17
puts 'Seeding Listings'
listings.each do |listing|
  random_number = rand(1..6)
  list = Listing.create(listing)
  list.picture.attach(
    io: File.open("app/assets/images/shoes/yeezy350-#{random_number}.jpg"),
    filename: "yeezy350-#{random_number}.jpg",
    content_type: "image/jpg"
  )
  puts "created a #{list[:name]} listing"
end
puts 'Successfully Seeded Listings ✅'
p "--" * 17