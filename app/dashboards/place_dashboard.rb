require "administrate/base_dashboard"

class PlaceDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    kind: SelectField.with_options(
      choices: Kind.codes
    ),
    street: Field::String,
    zip_code: Field::String,
    city: Field::String,
    url: Field::String,
    description: Field::Text,
    owner_name: Field::String,
    owner_email: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    state: SelectField.with_options(
      choices: Place.aasm.states
    ),
    latitude: Field::Number.with_options(decimals: 2),
    longitude: Field::Number.with_options(decimals: 2),
    logo_url: Field::String,
    twitter_name: Field::String,
    country_code: Field::String,
    place_updates: Field::HasMany
  }

  COLLECTION_ATTRIBUTES = [
    :id,
    :name,
    :kind,
    :street,
  ]

  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :name,
    :kind,
    :street,
    :zip_code,
    :city,
    :url,
    :description,
    :owner_name,
    :owner_email,
    :created_at,
    :updated_at,
    :state,
    :latitude,
    :longitude,
    :logo_url,
    :twitter_name,
    :country_code,
    :place_updates
  ]

  FORM_ATTRIBUTES = [
    :name,
    :kind,
    :street,
    :zip_code,
    :city,
    :url,
    :description,
    :owner_name,
    :owner_email,
    :state,
    :latitude,
    :longitude,
    :logo_url,
    :twitter_name,
    :country_code
  ]

  def display_resource(place)
    "#{place.name}"
  end
end
