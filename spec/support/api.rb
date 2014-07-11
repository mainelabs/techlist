module Api
  def response_json
    JSON.parse(response.body)
  end

  def serializer_hash(serializer)
    JSON.parse(serializer.to_json, symbolize_names: true)
  end

  def headers(options = {})
    headers = {
      'Content-Type' => 'application/json'
    }
    if options[:auth].present?
      headers['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(options[:auth].email,options[:auth].password)
    end
    headers
  end
end

RSpec.configure do |config|
  config.include Api
end
