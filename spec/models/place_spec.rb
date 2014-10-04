require 'spec_helper'

describe Place do
  it { should validate_presence_of(:name) }
  it { should allow_value(Place::KINDS.first).for(:kind) }
  it { should_not allow_value(['Bar']).for(:kind) }

  describe '#valid?' do
    context 'when location has not been geocoded' do
      it 'geocodes location' do
        stub_geocoding_request('Undefined address', 47.47, -0.55)

        place = Place.new(address: 'Undefined address')
        place.valid?

        expect(place.latitude).to eq(47.47)
        expect(place.longitude).to eq(-0.55)
      end
    end

    context 'when initialized with latitude and longitude coordinates' do
      it 'does not geocode' do
        Place.geocoding_service = double('geocoding service', coordinates: nil)

        place = build(:place)
        place.valid?

        expect(Place.geocoding_service).not_to have_received(:coordinates)
      end
    end
  end
end
