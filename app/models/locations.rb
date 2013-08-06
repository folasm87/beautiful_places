class Locations < ActiveRecord::Base
  attr_accessible :name, :latitude, :longitude
  acts_as_gmappable
  
  def gmaps4rails_address
      name
  end
end
