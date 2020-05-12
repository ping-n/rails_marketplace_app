require_relative 'data/data'

#Cleaning up Data-base
Category.destroy_all
Listing.destroy_all
User.destroy_all


puts 'Seeding Users'
p "--" * 17
user = User.create(email: 'admin@mail.com', password: 'password')
puts "Created User 1"
user2 = User.create(email: 'test@mail.com', password: 'password')
puts "Created User 2"
p "--" * 17
puts 'Successfully Seeded Users ✅'

