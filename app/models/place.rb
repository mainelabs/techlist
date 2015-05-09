class Place < ActiveRecord::Base
  include PlaceConcern

  class_attribute :geocoding_service
  self.geocoding_service = Geocoder
  geocoded_by :address

  before_save :set_coordinates, if: :geocoding_necessary?

  scope :displayable, -> { active.where.not(longitude: nil, latitude: nil) }

  include AASM
  aasm column: 'state' do
    state :pending, initial: true
    state :active
    state :rejected

    event :accept do
      transitions from: :pending, to: :active
    end

    event :reject do
      transitions from: :pending, to: :rejected
    end
  end

  def address
    [street, zip_code, city, country_code].compact.join(', ')
  end

  def header_image
    "http://maps.google.com/maps/api/staticmap?sensor=false&size=600x100&zoom=15&center=#{latitude},#{longitude}&markers=color:yellow|#{latitude},#{longitude}&key=#{ENV.fetch('GOOGLE_MAPS_KEY')}"
  end

  def self.latest
    active.order(created_at: :desc).limit(4)
  end

  def self.random
    connection.execute("select setseed(#{rand(-1.0..1.0)})")
    active.order('random()').limit(4)
  end

  def self.count_by_kind
    facets = {}
    Kind.codes.each do |code|
      count = Place.where(kind: code).count
      if count > 0
        facets[code] = count
      end
    end
    facets
  end

  private

  def address_changed?
    (changed & ['street', 'zip_code', 'city', 'country_code']).any?
  end

  def geocoding_necessary?
    if new_record?
      missing_coordinates?
    else
      address_changed?
    end
  end

  def missing_coordinates?
    latitude.blank? || longitude.blank?
  end

  def set_coordinates
    self.latitude, self.longitude = geocoding_service.coordinates(address)
  end
end
