require 'spec_helper'

describe 'POST /api/v1/places' do
  it 'creates a new place and returns it' do
    place = build(:place)

    post "/api/v1/places", {
      name: place.name,
      kind: place.kind,
      url: place.url,
      owner_email: place.owner_email,
      latitude: place.latitude,
      longitude: place.longitude
    }.to_json, headers

    place = Place.last
    expect(response_json).to eq(
      'place' => {
        'id' => place.id,
        'name' => place.name,
        'kind' => place.kind,
        'state' => place.state,
        'latitude' => place.latitude,
        'longitude' => place.longitude,
        'address' => nil,
        'zip_code' => nil,
        'city' => nil,
        'url' => place.url,
        'logo_url' => place.logo_url,
        'description' => nil,
        'twitter_name' => place.twitter_name,
        'created_at' => place.created_at.as_json,
        'updated_at' =>place.updated_at.as_json
      }
    )
  end

  it 'returns an error when invalid' do
    post '/api/v1/places', {
      name: 'I should give a kind'
    }.to_json, headers

    expect(response.code.to_i).to eq 422
    expect(response_json['errors']['kind'].size).to eq 2
  end
end
