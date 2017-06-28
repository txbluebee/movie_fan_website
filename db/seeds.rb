Movie.destroy_all
Review.destroy_all

10.times do |index|
  new_movie = Movie.create!(
    name: Faker::Book.title,
    actors: Faker::Book.author,
    image: Faker::Avatar.image,
    genre: Faker::Book.genre,
  )
  rand(1..5).times do |review|
    Review.create!(
      author: Faker::Friends.character,
      rating: Faker::Number.between(1, 10),
      content: Faker::Lorem.sentence(3),
      movie_id: new_movie.id
    )
  end
end
