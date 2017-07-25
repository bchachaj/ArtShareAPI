# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

king = User.create!(username: "The King")
jester = User.create!(username: "The Jester")
painter = User.create!(username: "The Painter")

painting = Artwork.create!(title: "Apathy", artist: painter)

king_views_painting = ArtworkShare.create!(viewer: king, artwork: painting)
jester_views_painting = ArtworkShare.create!(viewer: jester, artwork: painting)
