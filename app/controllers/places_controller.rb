class PlacesController < ApplicationController
  def index
    @counter = 0
    @locations = Locations.all
    @json = @locations.to_gmaps4rails do |place, marker|
    marker.infowindow render_to_string(:partial => "/places/infowindow", :locals => { :place => place})
    marker.title "#{place.name}"
=begin
    marker.json({ :population => city.population})
    marker.picture({:picture => "http://mapicons.nicolasmollet.com/     wp-content/uploads/mapicons/shape-default/color-3875d7/shapeco     lor-color/shadow-1/border-dark/symbolstyle-contrast/symbolshad     owstyle-dark/gradient-iphone/information.png",
                    :width => 32,
                    :height => 32})
=end
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @json  } #@locations
    end
  end
end
