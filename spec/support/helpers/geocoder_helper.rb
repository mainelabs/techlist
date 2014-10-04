module GeocoderHelper
  def stub_geocoding_request(*strings, latitude, longitude)
    strings.each do |string|
      FakeGeocoder[string] = [latitude, longitude]
    end
    Place.geocoding_service = FakeGeocoder
  end
end

RSpec.configure do |config|
  config.around(:each) do
    FakeGeocoder.clear
  end
end
