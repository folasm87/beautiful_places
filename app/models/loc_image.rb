class LocImage < ActiveRecord::Base
  attr_accessible :location, :image_url, :location_id, :name
  belongs_to :location
  
end
