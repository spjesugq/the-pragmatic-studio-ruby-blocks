class Movie
  attr_reader :title, :rating, :duration

  def initialize(title, rating, duration)
    @title = title
    @rating = rating
    @duration = duration
  end

  def watch
    puts "Watching #{title} – #{rating} (#{duration} mins)..."
  end
end

movie_1 = Movie.new("Toy Story", "G", 81)
movie_2 = Movie.new("Cast Away", "PG", 143)
movie_3 = Movie.new("Apollo 13", "PG", 140)
movie_4 = Movie.new("Cars", "G", 117)

class MovieQueue
  include Enumerable

  def initialize(name)
    @name = name
    @movies = []
  end

  def add_movie(movie)
    @movies << movie
  end

  def each
    @movies.each { |movie| yield movie }
  end

  def each_by_rating(rating)
    @movies.select { |movie| movie.rating == rating }.each { |movie| yield movie }
  end
end

queue = MovieQueue.new("Friday Night")
queue.add_movie(movie_1)
queue.add_movie(movie_2)
queue.add_movie(movie_3)

queue.each { |movie| movie.watch }
queue.each_by_rating("PG") { |movie| movie.watch }
queue.select { |movie| movie.duration > 100 }.each { |movie| movie.watch }
queue.detect { |movie| movie.title =~ /13/ }

puts ""

module MyEnumerable
  def my_select
    new_array = []
    each do |value|
      new_array << value if yield(value)
    end
    new_array
  end

  def my_map
    new_array = []
    each do |value|
      new_array << yield(value)
    end
    new_array
  end
end

class MovieQueue
  include MyEnumerable
end

queue.my_select { |movie| movie.duration > 100 }.each { |movie| movie.watch }
queue.my_map { |movie| movie.title.downcase }.each { |movie| puts movie }
