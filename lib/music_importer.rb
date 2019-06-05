require 'pry'

class MusicImporter
  attr_accessor :path, :filenames
  
  def initialize(path)
    @path = path
  end
  
  def files
    @filenames ||= Dir.glob("#{@path}/*.mp3").map{|filename| filename.gsub("#{@path}/", "")}
  end
  
  def import
    files.map {|filename| Song.create_from_filename(filename)}
  end
  
end