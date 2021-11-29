# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
List.destroy_all
Shotgun.destroy_all
User.destroy_all

# Decomment to launch user creation
user1 = { username: "Ash", email: "Ash@Kanto.com", password: "123456" }
user2 = { username: "Brock", email: "Brock@Kanto.com", password: "123456" }
user3 = { username: "Misty", email: "Misty@Kanto.com", password: "123456" }
user4 = { username: "Sacha", email: "sacha@Kanto.com", password: "123456" }
user5 = { username: "Ced", email: "ced@Kanto.com", password: "123456" }
user6 = { username: "Arti", email: "arti@Kanto.com", password: "123456" }
user7 = { username: "Alex", email: "alex@Kanto.com", password: "123456" }
user8 = { username: "Kevin", email: "kevin@Kanto.com", password: "123456" }
user9 = { username: "Clement", email: "clement@Kanto.com", password: "123456" }
user10 = { username: "Valou", email: "valou@Kanto.com", password: "123456" }
user11 = { username: "External Guest", email: "guest@Kanto.com", password: "123456" }

[user1, user2, user3, user4, user5, user6, user7, user8, user9, user10, user11].each do |attributes|
  user = User.create!(attributes)
  puts "Created #{user.username}"
end
puts "Finished Users!"

# ["Sports ⚽️", "Game 🃏", "Promo 💥", "Party 🥳", "Product 🚀", "Holiday 😎", "Food 🍕", "Other 👥"]

puts "Creating Lists..."
coffee = { name: "Coffee", description: "fight for coffee", places: 5, category: "Food", user_id: 1, start_time: "2021-11-25 14:00:00", end_time: "2021-11-25 18:00:00", prebookspot: "false" }
beer = { name: "Beer", description: "fight for beer", places: 3, category: "Food", user_id: 2, start_time: "2021-11-26 14:00:00", end_time: "2021-11-27 18:00:00", prebookspot: "false" }
poker = { name: "Poker", description: "Shuffle up & deal", places: 5, category: "Game", user_id: 3, start_time: "2021-11-25 12:00:00", end_time: "2021-11-29 18:00:00", prebookspot: "false" }
foot = { name: "Foot", description: "Arena 5v5", places: 9, category: "Sports", user_id: 4, start_time: "2021-11-25 8:00:00", end_time: "2021-11-30 12:00:00", prebookspot: "false" }
party = { name: "Dinner", description: "Jap at home", places: 4, category: "Party", user_id: 5, start_time: "2021-11-25 14:00:00", end_time: "2021-11-26 20:00:00", prebookspot: "false" }
amsterdam = { name: "Amsterdam", description: "chillin' and puffin'", places: 4, category: "Holiday", user_id: 6, start_time: "2021-11-25 9:00:00", end_time: "2021-11-30 18:00:00", prebookspot: "false" }
concert = { name: "Damso concert", description: "Disney arena", places: 20, category: "Other", user_id: 8, start_time: "2021-11-25 8:00:00", end_time: "2021-12-23 18:00:00", prebookspot: "false" }

[coffee, beer, poker, foot, party, amsterdam, concert].each do |attributes|
  list = List.create!(attributes)
  puts "Created #{list.name}"
end
puts "Finished!"

shot1 = { list_id: 1, user_id: 2 }
shot2 = { list_id: 1, user_id: 3 }
shot3 = { list_id: 1, user_id: 4 }
shot4 = { list_id: 1, user_id: 5 }
shot5 = { list_id: 2, user_id: 1 }
shot6 = { list_id: 2, user_id: 3 }
shot7 = { list_id: 2, user_id: 4 }
shot8 = { list_id: 2, user_id: 5 }
shot9 = { list_id: 2, user_id: 6 }
shot10 = { list_id: 3, user_id: 1 }
shot11 = { list_id: 3, user_id: 2 }
shot12 = { list_id: 3, user_id: 4 }
shot13 = { list_id: 3, user_id: 6 }
shot14 = { list_id: 3, user_id: 7 }
shot15 = { list_id: 3, user_id: 9 }
shot16 = { list_id: 4, user_id: 1 }
shot17 = { list_id: 4, user_id: 2 }
shot18 = { list_id: 4, user_id: 5 }
shot19 = { list_id: 4, user_id: 6 }
shot20 = { list_id: 4, user_id: 7 }
shot21 = { list_id: 4, user_id: 8 }
shot22 = { list_id: 4, user_id: 9 }
shot23 = { list_id: 4, user_id: 3 }
shot24 = { list_id: 5, user_id: 1 }
shot25 = { list_id: 5, user_id: 4 }
shot26 = { list_id: 5, user_id: 6 }
shot27 = { list_id: 5, user_id: 2 }
shot28 = { list_id: 6, user_id: 4 }
shot29 = { list_id: 6, user_id: 2 }
shot30 = { list_id: 7, user_id: 1 }
shot31 = { list_id: 7, user_id: 3 }
shot32 = { list_id: 7, user_id: 6 }
shot33 = { list_id: 7, user_id: 8 }
shot34 = { list_id: 7, user_id: 9 }
shot35 = { list_id: 7, user_id: 2 }

[shot1, shot2, shot3, shot4, shot5, shot6, shot7, shot8, shot9, shot10, shot11, shot12, shot13, shot14, shot15, shot16, shot17, shot18, shot19, shot20, shot21, shot22, shot23, shot24, shot25, shot26, shot27, shot28, shot29, shot30, shot31, shot32, shot33, shot34, shot35].each do |attributes|
  shot = Shotgun.create!(attributes)
  puts "Created #{shot.id}"
end
puts "Finished!"
