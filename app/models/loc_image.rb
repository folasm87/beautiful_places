class LocImage < ActiveRecord::Base
  attr_accessor :image_location, :image_url
  belongs_to :locations
  
end
