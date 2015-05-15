class PlacesController < ApplicationController
  has_scope :q

  def index
    @places = apply_scopes(Place).ordered_by_update.page(params[:page])

    respond_to do |format|
      format.js { render partial: 'places_list' }
      format.html
    end
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

  def edit
    @place_update = PlaceUpdate.from_place(Place.displayable.find(params[:id]))
  end

  def update
    @place_update = PlaceUpdate.from_place(Place.displayable.find(params[:id]))
    @place_update.attributes = place_params(:place_update)

    if !@place_update.save(context: :user_input)
      render :edit
    end
  end

  private

  def place_params(model = :place)
    params.require(model)
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
