require 'spec_helper'

describe Place do
  it { should validate_presence_of(:name) }
  it { should allow_value(Place::KINDS.first).for(:kind) }
  it { should_not allow_value(['Bar']).for(:kind) }

  describe '#valid?' do
    it 'geocodes location when location coordinates has not been provided' do
      stub_geocoding_request('Undefined address', 47.47, -0.55)

      place = Place.new(address: 'Undefined address')
      place.valid?

      expect(place.latitude).to eq(47.47)
      expect(place.longitude).to eq(-0.55)
    end

    it 'geocodes location when updating location address' do
      stub_geocoding_request('20 rue Pablo Picasso', 45.42, 4.42)

      place = create(:place)
      place.address = '20 rue Pablo Picasso'
      place.valid?

      expect(place.latitude).to eq(45.42)
      expect(place.longitude).to eq(4.42)
    end

    it 'does not geocode when initialized with latitude and longitude coordinates' do
      Place.geocoding_service = double('geocoding service', coordinates: nil)

      place = build(:place)
      place.valid?

      expect(Place.geocoding_service).not_to have_received(:coordinates)
    end

    it 'does not geocode when address does not change' do
      place = create(:place)
      Place.geocoding_service = double('geocoding service', coordinates: nil)

      place.valid?

      expect(Place.geocoding_service).not_to have_received(:coordinates)
    end

  end
end
