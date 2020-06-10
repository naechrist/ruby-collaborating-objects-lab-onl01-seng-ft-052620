require 'pry'
class Song

  attr_accessor :name, :artist, :songs
@@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.new_by_filename(file)
    song_info = file.split(" - ")
    song = Song.new(song_info[1])
    song.artist_name = song_info[0]
    song
  end

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by_name(artist_name)
    artist.add_song(self)
  end


  def self.all
    @@all
  end
end
