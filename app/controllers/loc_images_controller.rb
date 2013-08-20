class LocImagesController < ApplicationController
  before_action :set_loc_image, only: [:show, :edit, :update, :destroy]

  # GET /loc_images
  # GET /loc_images.json
  def index
    @loc_images = LocImage.all
    
  end

  # GET /loc_images/1
  # GET /loc_images/1.json
  def show
  end

  # GET /loc_images/new
  def new
    @loc_image = LocImage.new
  end

  # GET /loc_images/1/edit
  def edit
  end

  # POST /loc_images
  # POST /loc_images.json
  def create
    @loc_image = LocImage.new(loc_image_params)

    respond_to do |format|
      if @loc_image.save
        format.html { redirect_to @loc_image, notice: 'Loc image was successfully created.' }
        format.json { render action: 'show', status: :created, location: @loc_image }
      else
        format.html { render action: 'new' }
        format.json { render json: @loc_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loc_images/1
  # PATCH/PUT /loc_images/1.json
  def update
    respond_to do |format|
      if @loc_image.update(loc_image_params)
        format.html { redirect_to @loc_image, notice: 'Loc image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @loc_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loc_images/1
  # DELETE /loc_images/1.json
  def destroy
    @loc_image.destroy
    respond_to do |format|
      format.html { redirect_to loc_images_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loc_image
      @loc_image = LocImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loc_image_params
      params.require(:loc_image).permit(:location_id, :image_url)
    end
end
