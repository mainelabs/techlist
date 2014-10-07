RSpec.configure do |config|
  config.around do |example|
    cached_geocoding_service = Place.geocoding_service
    example.run
    Place.geocoding_service = cached_geocoding_service
  end
end
