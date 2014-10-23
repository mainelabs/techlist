require_relative 'production'

Mail.register_interceptor RecipientInterceptor.new(ENV['EMAIL_RECIPIENTS'])

Rails.application.configure do
  if ENV['STAGING_USERNAME']
    config.middleware.insert_after(::Rack::Runtime, "::Rack::Auth::Basic", "Staging") do |u, p|
      [u, p] == [ENV['STAGING_USERNAME'], ENV['STAGING_PASSWORD']]
    end
  end

  config.action_mailer.default_url_options = { host: 'staging.techlist.com' }

  config.ember.variant = :production
end
