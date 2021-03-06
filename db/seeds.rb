# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create(username: '', password: '')
User.create(username: 'User1', password: 'test')
User.create(username: 'User2', password: 'test')
User.create(username: 'User3', password: 'test')
User.create(username: 'User4', password: 'test')
User.create(username: 'User5', password: 'test')

Dog.create([
    {name: Faker::TvShows::BojackHorseman.character, breed: "Labrador Retriever", temperament: "Confident", bio: Faker::TvShows::BojackHorseman.quote, zip_code: "10005", user_id: 1},
    {name: Faker::TvShows::BojackHorseman.character, breed: "Labrador Retriever", temperament: "Independent", bio: Faker::TvShows::BojackHorseman.quote, zip_code: "10001", user_id: 2},
    {name: Faker::TvShows::BojackHorseman.character, breed: "German Shepard", temperament: "Laid Back", bio: Faker::TvShows::BojackHorseman.quote, zip_code: "10005", user_id: 3},
    {name: Faker::TvShows::BojackHorseman.character, breed: "Sharpei", temperament: "Shy", bio: Faker::TvShows::BojackHorseman.quote, zip_code: "10027", user_id: 4},
    {name: Faker::TvShows::BojackHorseman.character, breed: "Dachshund", temperament: "Adaptable", bio: Faker::TvShows::BojackHorseman.quote, zip_code: "10027", user_id: 5}
])

DogPhoto.create([
    {img_link: "https://images.unsplash.com/photo-1507146426996-ef05306b995a", details: "Felt cute, might delete later idk", dog_id: 1},
    {img_link: "https://images.unsplash.com/photo-1518020382113-a7e8fc38eac9", details: "Selfie of the century", dog_id: 2},
    {img_link: "https://images.unsplash.com/photo-1494870363241-b5225be3dada", details: "Selfie of the century", dog_id: 3},
    {img_link: "https://images.unsplash.com/photo-1546659935-24325ae0493d", details: "Look at my bandana!", dog_id: 3},
    {img_link: "https://images.unsplash.com/photo-1529947320894-e522e075160f", details: "Woke up like this, #nofilter, #beyonce", dog_id: 3},
    {img_link: "https://images.unsplash.com/photo-1505628346881-b72b27e84530", details: "Selfie of the century", dog_id: 4},
    {img_link: "https://images.unsplash.com/photo-1550165298-39a6ab9a0a6f", details: "It was such a beautiful day!", dog_id: 5}
])