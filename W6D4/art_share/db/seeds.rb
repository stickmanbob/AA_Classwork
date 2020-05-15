# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tables = [User, Artwork, ArtworkShare]

tables.each { |table| table.destroy_all }

michael = User.create!(username: "michael")
ajay = User.create!(username: "ajay")
da_vinci = User.create!(username: "leoDaVinci")

mona_lisa = Artwork.create!(artist_id: da_vinci.id, title: "Mona Lisa", img_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg/800px-Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg")

share = ArtworkShare.create!(viewer_id: michael.id, artwork_id: mona_lisa.id)