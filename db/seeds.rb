# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Dog.create([
    {name: Faker::TvShows::BojackHorseman.character, breed: "Labrador Retriever", temperament: "Confident", bio: Faker::TvShows::BojackHorseman.quote, zip_code: "10005"},
    {name: Faker::TvShows::BojackHorseman.character, breed: "Labrador Retriever", temperament: "Independent", bio: Faker::TvShows::BojackHorseman.quote, zip_code: "10001"},
    {name: Faker::TvShows::BojackHorseman.character, breed: "German Shepard", temperament: "Laid Back", bio: Faker::TvShows::BojackHorseman.quote, zip_code: "10005"},
    {name: Faker::TvShows::BojackHorseman.character, breed: "Sharpei", temperament: "Shy", bio: Faker::TvShows::BojackHorseman.quote, zip_code: "10027"},
    {name: Faker::TvShows::BojackHorseman.character, breed: "Dachshund", temperament: "Adaptable", bio: Faker::TvShows::BojackHorseman.quote, zip_code: "10027"}
])