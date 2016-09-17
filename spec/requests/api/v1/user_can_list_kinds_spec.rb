require 'rails_helper'

describe 'GET /api/v1/kinds' do
  it 'returns kinds list' do
    get '/api/v1/kinds', headers: headers

    expect(response_json['kinds'].length).to eq Kind.codes.length
  end
end
