require 'rails_helper'

describe PlaceUpdate do
  it { should validate_presence_of(:place) }

  describe '#from_place' do
    it 'returns a PlaceUpdate based on the given place' do
      place = create(:place, :in_angers_with_coordinates)

      place_update = PlaceUpdate.from_place(place)

      expect(place_update.place).to be(place)
      expect(place_update.name).to eq(place.name)
      expect(place_update.id).to be_nil
    end
  end

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
