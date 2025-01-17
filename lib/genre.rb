require 'pry'

class Genre
  extend Concerns::Findable
  
  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    self.new(name).tap{|new_genre| new_genre.save}
  end
  
  def add_song(song)
    #song.genre = self unless song.genre
    @songs << song unless @songs.include?(song)
  end
  
  def artists
    @songs.map(&:artist).uniq
  end
  
end