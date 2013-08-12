class Location < ActiveRecord::Base
  #attr_accessor :name, :gmaps
  attr_accessible :name
  acts_as_gmappable
  #has_many :loc_images
  #has_one :wikis
  def gmaps4rails_address
      name
  end
end
