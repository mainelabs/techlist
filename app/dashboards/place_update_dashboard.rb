require "administrate/base_dashboard"

class PlaceUpdateDashboard < Administrate::BaseDashboard
  EXCLUDED_ATTRIBUTES = [:latitude, :longitude, :country_code]

  ATTRIBUTE_TYPES =  PlaceDashboard::ATTRIBUTE_TYPES

  COLLECTION_ATTRIBUTES = PlaceDashboard::COLLECTION_ATTRIBUTES

  SHOW_PAGE_ATTRIBUTES = PlaceDashboard::SHOW_PAGE_ATTRIBUTES - EXCLUDED_ATTRIBUTES

  FORM_ATTRIBUTES = PlaceDashboard::FORM_ATTRIBUTES - EXCLUDED_ATTRIBUTES

  def display_resource(place_update)
    "Update : #{place_update.place.name}"
  end
end
