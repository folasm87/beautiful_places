class Wiki < ActiveRecord::Base
  attr_accessible :article_location, :article_url
  #has_many :loc_images
  belongs_to :location
end
