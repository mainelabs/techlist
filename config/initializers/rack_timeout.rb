if Rails.env.production? || Rails.env.staging?
  Rack::Timeout.timeout = (ENV['RACK_TIMEOUT'] || 10).to_i
end
