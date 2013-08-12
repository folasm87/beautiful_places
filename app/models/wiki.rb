class Wiki < ActiveRecord::Base
  attr_accessible :article_location, :article_url
 # belongs_to :location
end
