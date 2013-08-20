class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all

  end

  # GET /locations/1
  # GET /locations/1.json
  def show
  end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(location_params)

    loc_name  = @location.name + '';
    @imageJSON = 'https://www.googleapis.com/customsearch/v1?key=AIzaSyBSP7DBzAh-_YxOWF270KAPgHZtwYoUxBE&cx=002605916911289929646:xfgky2opaiu&q=';
    @imageJSON += loc_name;
    @imageJSON += '&imgType=photo&alt=json&safe=high&fields=items(pagemap(cse_image/src))';
    @wikiJSON = 'https://www.googleapis.com/customsearch/v1?key=AIzaSyBSP7DBzAh-_YxOWF270KAPgHZtwYoUxBE&cx=002605916911289929646:qdqm5p91rc0&q=';
    @wikiJSON += loc_name;
    @wikiJSON += '&alt=json&safe=high&fields=items(link)';
    encoded_url = URI.encode(@imageJSON)
    encoded_url_2 = URI.encode(@wikiJSON)
    temp = JSON.parse HTTParty.get(encoded_url).response.body
    temp2 = JSON.parse HTTParty.get(encoded_url_2).response.body
    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render action: 'show', status: :created, location: @location }

        wiki_link = temp2["items"][0]["link"];
        
        @wiki = Wiki.create(article_location:@location.name, article_url:wiki_link)
        @location.wiki = @wiki
        puts wiki_link
        puts "############################################################################################################################################################"
        temp["items"].each do |t|
          url = t["pagemap"]["cse_image"][0]["src"]
          url = url.to_s
          link_html = '<img src="'
          link_html += url
          link_html += '"/>' 
          puts url
          @loc_image = @location.loc_images.create(location:@location, image_url:url, name:@location.name)
          #@loc_image = @location.loc_images.create(location:@location, image_url:link_html, name:@location.name)
          #@loc_image = LocImage.create(location:@location, image_url:url)
          #puts #{@location_id}
          #puts @location
          puts url
        end
        
       
        

      else
        format.html { render action: 'new' }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_location
    @location = Location.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def location_params
    params.require(:location).permit(:name)
  end
end
