require 'spec_helper'

describe 'POST /api/v1/places' do
  it 'creates a new place and returns it' do
    place = build(:place)

    post "/api/v1/places", {
      name: place.name,
      kind: place.kind,
      url: place.url,
      owner_email: place.owner_email
    }.to_json, headers

    place = Place.last
    expect(response_json).to eq(
      'id' => place.id,
      'name' => place.name,
      'kind' => place.kind,
      'address' => nil,
      'zip_code' => nil,
      'city' => nil,
      'url' => place.url,
      'description' => nil,
      'owner_name' => nil,
      'owner_email' => place.owner_email,
      'created_at' => place.created_at.as_json,
      'updated_at' =>place.updated_at.as_json
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
