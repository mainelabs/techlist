class Api::V1::PlacesController < Api::V1::BaseController
  def index
    respond_to do |format|
      format.json { render json: Place.displayable }
      format.atom { @places_items = Place.displayable.order('updated_at DESC') }
    end
  end

  def show
    render json: Place.displayable.find(params[:id])
  end
end
