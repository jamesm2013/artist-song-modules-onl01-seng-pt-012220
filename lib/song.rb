require 'pry'

class Artist
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  extend Findable
  include Paramabl
  
  attr_accessor :name
  attr_reader :songs
  
  @@songs =[]
  
   def self.all
    @@songs
  end	
  
  def artist=(artist)
    @artist = artist	   
  end	