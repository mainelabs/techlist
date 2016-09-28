class PlaceUpdate < ApplicationRecord
  include PlaceConcern

  belongs_to :place

  validates :place, presence: true

  include AASM
  aasm column: 'state' do
    state :pending, initial: true
    state :active
    state :rejected

    event :accept do
      transitions from: :pending, to: :active, after: :apply_update
    end

    event :reject do
      transitions from: :pending, to: :rejected
    end
  end

  def self.from_place(place)
    self.new(place.duplicable_attributes.merge!(place: place))
  end

  private

  def apply_update
    place.update(duplicable_attributes)
  end
end
