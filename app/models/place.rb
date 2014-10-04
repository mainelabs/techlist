class Place < ActiveRecord::Base
  class_attribute :geocoding_service
  self.geocoding_service = Geocoder

  validates :name, presence: true
  validates :state, presence: true
  validates :kind, presence: true, inclusion: { in: Kind.codes }

  geocoded_by :full_address

  after_validation :set_coordinates, if: :missing_coordinates?

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

  rails_admin do
    list do
      filters [:state, :kind]
      field :state
      field :kind
      field :name
      field :url
      field :owner_email
    end

    edit do
      field :name
      field :kind
      field :state
      field :address
      field :zip_code
      field :city
      field :country_code
      field :latitude
      field :longitude
      field :url
      field :twitter_name
      field :logo_url
      field :description
      field :owner_name
      field :owner_email
    end
  end

  def kind_enum
    Kind.codes
  end

  def state_enum
    aasm.states
  end

  def full_address
    [address, zip_code, city, country_code].compact.join(', ')
  end

  private

  def missing_coordinates?
    latitude.blank? || longitude.blank?
  end

  def set_coordinates
    self.latitude, self.longitude = geocoding_service.coordinates(full_address)
  end
end
