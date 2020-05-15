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
user = User.create(email: 'admin@mail.com', password: 'pass123', role: 1)
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
listings.each_with_index do |listing, index|
  counter = 
  list = Listing.create(listing.except(:picture))
  list.picture.attach(
    io: File.open("app/assets/images/shoes/yeezy350-#{index+= 1}.jpg"),
    filename: "yeezy350-#{index+= 1}.jpg",
    content_type: "image/jpg"
  )
  puts "created a #{list[:name]} listing"
end
puts 'Successfully Seeded Listings ✅'
p "--" * 17