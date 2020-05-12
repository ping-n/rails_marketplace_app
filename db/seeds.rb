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
user = User.create(email: 'admin@mail.com', password: 'password')
puts "Created User 1"
user2 = User.create(email: 'test@mail.com', password: 'password')
puts "Created User 2"
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
  list = Listing.create(listing)
  puts "created a #{list[:name]} listing"
end
puts 'Successfully Seeded Listings ✅'
p "--" * 17