# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Room.delete_all
Roommate.delete_all
Place.delete_all
Comment.delete_all

users = User.create([
  {email: "sam@gmail.com", password: "password1"},
  {email: "andy@gmail.com", password: "password1"},
  {email: "brandon@gmail.com", password: "password1"}
])

rooms = Room.create([
  {name: "Room1"},
  {name: "Room2"}

])

roommates = Roommate.create([
  {user_id: users[0].id, room_id: rooms[0].id, accepted: true},
  {user_id: users[1].id, room_id: rooms[0].id, accepted: false},
  {user_id: users[2].id, room_id: rooms[1].id, accepted: true}
])

places = Place.create([
  {url: "http://www.zillow.com/homedetails/315-E-St-NE-Washington-DC-20002/414638_zpid/", rank: 1, address: "123 Sample Way", price: 3500, beds: 3, baths: 2, sqft: 1235, amenities: "Cable ready, wifi", room_id: rooms[0].id},
  {url: "http://www.zillow.com/homedetails/415-12th-St-NE-B-Washington-DC-20002/2104786339_zpid/", rank: 1, address: "234 Test Court", price: 4500, beds: 4, baths: 2.5, sqft: 2000, amenities: "Wifi, pool", room_id: rooms[1].id}
])

comments = Comment.create([
  {user_id: users[0].id, place_id: places[0].id, body: "Too expensive"},
  {user_id: users[2].id, place_id: places[1].id, body: "This one is nice"},
  {user_id: users[0].id, place_id: places[0].id, body: "This one is better"}
])
