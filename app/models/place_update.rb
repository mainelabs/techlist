class PlaceUpdate < Place
  belongs_to :place

  validates :place, presence: true

  aasm column: 'state' do
    event :accept do
      transitions from: :pending, to: :active, on_transition: :apply_update
    end
  end

  private

  def apply_update
    place.update(
      name: name,
      kind: kind,
      url: url,
      twitter_name: twitter_name,
      logo_url: logo_url,
      description: description,
      street: street,
      zip_code: zip_code,
      city: city)
  end
end
