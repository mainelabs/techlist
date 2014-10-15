class PlaceUpdate < Place
  belongs_to :place

  validates :place, presence: true

  aasm column: 'state' do
    state :pending, initial: true
    state :active
    state :rejected

    event :accept do
      transitions from: :pending, to: :active
    end

    event :accept do
      transitions from: :pending, to: :active, on_transition: :apply_update
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
