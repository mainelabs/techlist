require "administrate/base_dashboard"

class PlaceUpdateDashboard < Administrate::BaseDashboard
  EXCLUDED_ATTRIBUTES = [:latitude, :longitude, :country_code, :place_updates]

  ATTRIBUTE_TYPES =  PlaceDashboard::ATTRIBUTE_TYPES.merge(
    place: Field::BelongsTo
  )

  COLLECTION_ATTRIBUTES = PlaceDashboard::COLLECTION_ATTRIBUTES

  SHOW_PAGE_ATTRIBUTES = PlaceDashboard::SHOW_PAGE_ATTRIBUTES - EXCLUDED_ATTRIBUTES

  FORM_ATTRIBUTES = PlaceDashboard::FORM_ATTRIBUTES - EXCLUDED_ATTRIBUTES + [:place]

  def display_resource(place_update)
    "Update : #{place_update.place.name}"
  end
end
