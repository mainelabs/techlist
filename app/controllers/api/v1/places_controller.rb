class Api::V1::PlacesController < Api::V1::BaseController
  def create
    place = Place.new(place_params)
    if place.save
      render json: place
    else
      render json: {
        message: 'Place is not valid',
        errors: place.errors
      }, status: :unprocessable_entity
    end
  end

  def index
    render json: Place.active
  end

  private

  def place_params
    params.permit(:name,
                  :kind,
                  :lat,
                  :lon,
                  :address,
                  :zip_code,
                  :city,
                  :url,
                  :description,
                  :owner_name,
                  :owner_email)
  end
end
