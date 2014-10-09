class Api::V1::PlacesController < Api::V1::BaseController
  def index
    render json: Place.displayable
  end

  def show
    render json: Place.displayable.find(params[:id])
  end
end
