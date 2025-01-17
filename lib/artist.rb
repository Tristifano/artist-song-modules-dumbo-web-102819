require 'pry'
require_relative './concerns/memorable.rb'
require_relative './concerns/findable.rb'
require_relative './concerns/paramble.rb'

class Artist
  include Memorable::InstanceMethods, Paramble
  extend Memorable::ClassMethods, Findable 
  attr_accessor :name
  attr_reader :songs

  @@artists = []

  def initialize
    super
    @songs = []
  end

  def self.all
    @@artists
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end

  # def to_param
  #   name.downcase.gsub(' ', '-')
  # end
end
