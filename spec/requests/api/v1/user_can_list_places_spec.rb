require 'rails_helper'

describe 'GET /api/v1/places' do
  it 'returns places list' do
    create_list(:place, 5, :active)
    create(:place)

    get '/api/v1/places', headers: headers

    expect(response_json['places'].length).to eq 5
  end
end
