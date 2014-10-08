require 'rails_helper'

describe PlaceUpdate do
  it { should validate_presence_of(:place) }

  describe '#accept' do
    it 'merges update data with base place data' do
      Place.geocoding_service = double('geocoding service', coordinates: nil)
      place_update = create(:place_update, name: 'Craftsmen HQ', city: 'Sainté')
      original_id = place_update.place.id

      place_update.accept!

      place_update.reload
      expect(place_update.state).to eq('active')
      expect(place_update.place.name).to eq('Craftsmen HQ')
      expect(place_update.place.city).to eq('Sainté')
      expect(place_update.place.id).to eq(original_id)
    end
  end
end
