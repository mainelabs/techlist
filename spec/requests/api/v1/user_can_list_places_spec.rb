require 'spec_helper'

describe 'GET /api/v1/places' do
  it 'returns places list' do
    places = create_list(:place, 5, :active)

    get '/api/v1/places', nil, headers

    expect(response_json.length).to eq 5
  end
end
