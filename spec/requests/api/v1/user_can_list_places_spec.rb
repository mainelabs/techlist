require 'rails_helper'

describe 'GET /api/v1/places' do
  it 'returns places list' do
    create_list(:place, 5, :in_angers_with_coordinates, :active)
    create(:place, :in_angers_with_coordinates)

    get '/api/v1/places', nil, headers

    expect(response_json['places'].length).to eq 5
  end
end
