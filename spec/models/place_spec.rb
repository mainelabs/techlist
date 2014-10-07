require 'rails_helper'

describe Place do
  it { should validate_presence_of(:name) }
  it { should allow_value(Kind.codes.first).for(:kind) }
  it { should_not allow_value(['Bar']).for(:kind) }

  describe '#save' do
    it 'geocodes location when location coordinates has not been provided' do
      stub_geocoding_request('25 rue Lenepveu, 49100, Angers, FR', 47.47, -0.55)

      place = build(:place, :in_angers)
      place.save

      expect(place.latitude).to eq(47.47)
      expect(place.longitude).to eq(-0.55)
    end

    it 'geocodes location when updating location address' do
      stub_geocoding_request('20 rue Pablo Picasso, 42000, Saint-Etienne, FR', 45.42, 4.42)

      place = create(:place, :in_angers_with_coordinates)
      place.street = '20 rue Pablo Picasso'
      place.zip_code = '42000'
      place.city = 'Saint-Etienne'
      place.save

      expect(place.latitude).to eq(45.42)
      expect(place.longitude).to eq(4.42)
    end

    it 'does not geocode when initialized with latitude and longitude coordinates' do
      Place.geocoding_service = double('geocoding service', coordinates: nil)

      place = build(:place, :in_angers_with_coordinates)
      place.save

      expect(Place.geocoding_service).not_to have_received(:coordinates)
    end

    it 'does not geocode when address does not change' do
      place = create(:place, :in_angers_with_coordinates)
      Place.geocoding_service = double('geocoding service', coordinates: nil)

      place.name = 'foo'
      place.save

      expect(Place.geocoding_service).not_to have_received(:coordinates)
    end

  end
end
