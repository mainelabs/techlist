class PlacesController < ApplicationController
  def index
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if !@place.save
      render :new
    end
  end

  private

  def place_params
    params.require(:place)
          .permit(:name,
                  :kind,
                  :latitude,
                  :longitude,
                  :street,
                  :zip_code,
                  :city,
                  :url,
                  :logo_url,
                  :description,
                  :owner_name,
                  :owner_email)
  end
end
