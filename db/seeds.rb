require 'open-uri'
Bookmark.destroy.all
Movie.destroy_all
# List.destroy_all
puts "๐งน Cleaning movies and bookmarks..."
# the Le Wagon copy of the API
url = 'http://tmdb.lewagon.com/movie/top_rated'
response = JSON.parse(URI.open(url).read)

puts "๐ฑ Seeding...."
response['results'].each do |movie_hash|
  # create an instance with the hash
  Movie.create!(
    title: movie_hash['title'],
    overview: movie_hash['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500" + movie_hash['poster_path'],
    rating: movie_hash['vote_average']
  )
  puts "๐ฟ Add #{movie_hash['title']}.... "
end
puts "-------------------------"
puts "โ Finish seeding!"
