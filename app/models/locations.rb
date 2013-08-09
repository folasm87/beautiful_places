class Locations < ActiveRecord::Base
  attr_accessible :name, :latitude, :longitude
  acts_as_gmappable
  has_many :loc_images
  has_one :wiki
  def gmaps4rails_address
      name
  end
end
