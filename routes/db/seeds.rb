# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  User.destroy_all
  Artwork.destroy_all
  ArtworkShare.destroy_all

  billy = User.create!(username: "Billy")
  joseph = User.create!(username: "Joseph")
  tammy = User.create!(username: "Tammy")
  emily = User.create!(username: "Emily")

  billy_art = Artwork.create!(
    title: "Oh, Billy!",
    image_url: "ohbilly.jpg",
    artist_id: billy.id,
  )

  joseph_art = Artwork.create!(
    title: "Jesus, Joseph, and Mary",
    image_url: "itsaboy.jpg",
    artist_id: joseph.id
  )

  emily_art = Artwork.create!(
    title: "River Rats",
    image_url: "riverrats.png",
    artist_id: emily.id
  )

  emily_art_2 = Artwork.create!(
    title: "Harbor Rats",
    image_url: "harborrats.png",
    artist_id: emily.id
  )

  tammy_view = ArtworkShare.create!(
    artwork_id: billy_art.id,
    viewer_id: tammy.id
  )

  billy_view = ArtworkShare.create!(
    artwork_id: emily_art_2.id,
    viewer_id: billy.id
  )
end
