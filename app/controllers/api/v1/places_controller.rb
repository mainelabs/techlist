class Api::V1::PlacesController < Api::V1::BaseController
  def index
    render json: Place.active
  end

  def show
    render json: Place.find(params[:id])
  end
end
