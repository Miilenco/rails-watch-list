# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts 'Cleaning the databases...'
List.destroy_all
Bookmark.destroy_all
Movie.destroy_all

puts 'Adding movies...'
wonder_woman_movie = Movie.create!(
  title: "Wonder Woman 1984",
  overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s",
  poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg",
  rating: 6.9
)
puts 'Added Wonder Woman 1984 movie'

shawshank_redemption_movie = Movie.create!(
  title: "The Shawshank Redemption",
  overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison",
  poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg",
  rating: 8.7
)
puts 'Added The Shawshank Redemption movie'

titanic_movie = Movie.create!(
  title: "Titanic",
  overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.",
  poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg",
  rating: 7.9
)
puts 'Added Titanic movie'

oceans_eight_movie = Movie.create!(
  title: "Ocean's Eight",
  overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.",
  poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg",
  rating: 7.0
)
puts "Added Ocean's Eight movie"

puts "#{Movie.count} movies have been added."

puts "Adding lists..."
favourites_list = List.create!(
  name: "Favourites",
  image_url: "https://www.shutterstock.com/image-vector/vintage-movie-projector-santa-claus-600nw-1854929974.jpg"
)
puts "Added Favourites list"

recommendations_list = List.create!(
  name: "Recommendations",
  image_url: "https://static01.nyt.com/images/2024/12/12/books/review/12ThrillersList-COSBY/12ThrillersList-COSBY-articleLarge.jpg?quality=75&auto=webp&disable=upscale"
)
puts "Added Recommendations list"

puts "#{List.count} lists have been added"

puts "Adding movies to lists..."
add_wonder_woman_to_favourites = Bookmark.new(comment: "Best movie ever!")
add_wonder_woman_to_favourites.movie = wonder_woman_movie
add_wonder_woman_to_favourites.list = favourites_list
add_wonder_woman_to_favourites.save!
puts "Added Wonder Woman 1984 to Favourites"

add_titanic_to_recommendations = Bookmark.new(comment: "My partner's recommendation")
add_titanic_to_recommendations.movie = titanic_movie
add_titanic_to_recommendations.list = recommendations_list
add_titanic_to_recommendations.save!
puts "Added Titanic to Recommendations"

puts "#{Bookmark.count} bookmarks have been added"
