class Location < ActiveRecord::Base
  attr_accessible :name
  acts_as_gmappable
  has_one :wiki, dependent: :destroy
  has_many :loc_images, dependent: :destroy 
  def gmaps4rails_address
      name
  end
end
