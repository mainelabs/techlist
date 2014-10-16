class PlaceUpdate < ActiveRecord::Base
  belongs_to :place

  validates :place, presence: true
  validates :name, presence: true
  validates :kind, presence: true, inclusion: { in: Kind.codes }
  validates :street, presence: true
  validates :zip_code, presence: true
  validates :city, presence: true
  validates :description, presence: true, on: :user_input
  validates :owner_name, presence: true, on: :user_input
  validates :owner_email, presence: true, on: :user_input

  include AASM
  aasm column: 'state' do
    state :pending, initial: true
    state :active
    state :rejected

    event :accept do
      transitions from: :pending, to: :active, on_transition: :apply_update
    end

    event :reject do
      transitions from: :pending, to: :rejected
    end
  end

  def self.from_place(place)
    self.new(duplicable_attributes(place).merge!(place: place))
  end

  private

  def apply_update
    place.update(self.class.duplicable_attributes(self))
  end

  def self.duplicable_attributes(object)
    object.attributes.extract!(
      'name',
      'kind',
      'street',
      'zip_code',
      'city',
      'url',
      'description',
      'owner_name',
      'owner_email',
      'logo_url',
      'twitter_name'
    )
  end
end
