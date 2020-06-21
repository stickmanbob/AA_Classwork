# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Bench.destroy_all
User.destroy_all

####Users#######

User.create(username:"stickmanbob", password:"password")

####Benches#####
Bench.create description: "Wooden", lat: 37.781864, lng: -122.428858

Bench.create description: "Plastic", lat: 37.788627, lng: -122.442574

Bench.create description: "Shitty", lat: 37.782311, lng: -122.480168