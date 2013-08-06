class PlacesController < ApplicationController
  def index
    @locations = Locations.all
    @json = @locations.to_gmaps4rails
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @json  } #@locations
    end
  end
end
