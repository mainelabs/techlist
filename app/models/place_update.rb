class PlaceUpdate < Place
  belongs_to :place

  validates :place, presence: true

  include AASM
  aasm column: 'state' do
    state :pending, initial: true
    state :applied
    state :rejected

    event :accept do
      transitions from: :pending, to: :applied
    end

    event :reject do
      transitions from: :pending, to: :rejected
    end
  end
end
