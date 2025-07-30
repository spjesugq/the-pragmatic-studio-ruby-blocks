class Song
  attr_reader :name, :artist, :duration

  def initialize(name, artist, duration)
    @name = name
    @artist = artist
    @duration = duration
  end

  def play
    puts "Playing '#{name}' by #{artist} (#{duration} mins)..."
  end
end

song_1 = Song.new("Okie From Muskogee", "Merle", 5)
song_2 = Song.new("Ramblin' Man", "Hank", 7)
song_3 = Song.new("Good Hearted Woman", "Waylon", 6)

class Playlist
  include Enumerable

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def each
    @songs.each { |song| yield song }
  end

  def each_by_artist(artist)
    @songs.select { |song| song.artist == artist }.each { |song| yield song }
  end

  def each_tagline
    @songs.each { |song| yield "#{song.name} – #{song.artist}"}
  end

  def each_filename
    @songs.each do |song|
      basename = "#{song.name}-#{song.artist}".gsub(" ", "-").downcase
      extensions = [".mp3", ".wav", ".aac"]
      extensions.each { |extension| yield basename + extension }
    end
  end

  def play_songs
    each { |song| song.play }
  end
end

playlist = Playlist.new("Country/Western, Y'all!")
playlist.add_song(song_1)
playlist.add_song(song_2)
playlist.add_song(song_3)

playlist.each { |song| song.play }
playlist.play_songs

okie_songs = playlist.select { |song| song.name =~ /Okie/ }
p okie_songs

non_okie_songs = playlist.reject { |song| song.name =~ /Okie/ }
p non_okie_songs

p playlist.any? { |song| song.artist == "Hank" }
p playlist.detect { |song| song.artist == "Hank" }

song_labels = playlist.map { |song| "#{song.name} - #{song.artist}" }
p song_labels

total_duration = playlist.reduce(0) { |sum, song| sum + song.duration }
p total_duration

playlist.each_tagline { |tagline| puts tagline }
playlist.each_filename { |filename| puts filename }
playlist.each_by_artist("Hank") { |song| song.play }
playlist.each_by_artist("Waylon") { |song| song.play }
