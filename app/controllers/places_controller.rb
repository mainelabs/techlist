class PlacesController < ApplicationController
  def index
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if !@place.save(context: :user_input)
      render :new
    end
  end

  private

  def place_params
    params.require(:place)
          .permit(:name,
                  :kind,
                  :url,
                  :twitter_name,
                  :logo_url,
                  :description,
                  :street,
                  :zip_code,
                  :city,
                  :owner_name,
                  :owner_email)
  end
end
