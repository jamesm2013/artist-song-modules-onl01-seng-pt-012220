require 'pry'

class Artist
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  extend Findable
  include Paramable

  attr_accessor :name
  attr_reader :songs

  @@artists = []

  
  def initialize
    @@artists << self
    super
    @songs = []
  end

  def self.find_by_name(name)
    @@artists.detect{|a| a.name == name}
  end

  def self.all
    @@artists
  end

  def self.reset_all
    self.all.clear
  end

  def self.count
    self.all.count
  end

  def add_song(song)
    @songs << song
    song.artist = self
    songs.each { |song| add_song(song) }
  end

  def to_param
    name.downcase.gsub(' ', '-')
  end
end

module Findable

  def find_by_name(name)
    all.detect{|a| a.name == name}
  end
end 

module Memorable
  module ClassMethods
    def reset_all
      self.all.clear
    end
end
    def count
      self.all.count
    end
  end

  module InstanceMethods
    def initialize
      self.class.all << self
    end
  end
end 

module Paramable
  def to_param
    name.downcase.gsub(' ', '-')
  end
end 